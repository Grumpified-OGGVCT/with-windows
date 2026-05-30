<#
.SYNOPSIS
  Resolve a WITH crash-dump backtrace to function names using the linker .map.

.DESCRIPTION
  The build-scoped crash handler (rt_debug.h) writes with_crash.log containing
  absolute addresses and RVAs but no symbols (there is no .pdb). This script
  reads that log plus the lld-link /MAP output and prints `symbol + offset` for
  the faulting instruction and every backtrace frame.

  It needs no debugger. It parses the map's absolute "Rva+Base" column and, for
  each crash address, reports the nearest preceding public symbol.

.PARAMETER Log
  Crash log to read. Default: with_crash.log
.PARAMETER Map
  Linker map to read. Default: with.map
.EXAMPLE
  pwsh resolve-crash.ps1
  pwsh resolve-crash.ps1 -Log with_crash.log -Map with_trace.map
#>
param(
    [string]$Log = "with_crash.log",
    [string]$Map = "with.map"
)

$ErrorActionPreference = "Stop"

if (!(Test-Path -LiteralPath $Log)) { Write-Error "Crash log not found: $Log"; exit 1 }
if (!(Test-Path -LiteralPath $Map)) { Write-Error "Map file not found: $Map (link with /MAP:$Map)"; exit 1 }

# --- Build a sorted symbol table from the map -------------------------------
# Accept both common layouts. Capture (symbol, absoluteVA).
#   MSVC/lld style:  0001:00000020   rt_alloc__172   0000000140002020   f  rt_core.obj
$symbols = [System.Collections.Generic.List[object]]::new()

# Symbols and crash frames are matched in RVA space because the binary is
# ASLR-relocated at runtime (module base != map preferred base). RVAs are
# invariant; absolute VAs are not. Map column is Rva+Base, so RVA = VA - base.
$reBase = [regex]'Preferred load address is\s+([0-9A-Fa-f]{8,16})'
$reMsvc = [regex]'^\s*[0-9A-Fa-f]{4}:[0-9A-Fa-f]{8}\s+(\S+)\s+([0-9A-Fa-f]{12,16})\b'

$prefBase = [UInt64]0x140000000
foreach ($line in [System.IO.File]::ReadLines((Resolve-Path $Map))) {
    $b = $reBase.Match($line)
    if ($b.Success) { $prefBase = [Convert]::ToUInt64($b.Groups[1].Value, 16); continue }
    $m = $reMsvc.Match($line)
    if ($m.Success) {
        $sym = $m.Groups[1].Value
        $va  = [Convert]::ToUInt64($m.Groups[2].Value, 16)
        if ($va -ge $prefBase) {
            $symbols.Add([pscustomobject]@{ Addr = ($va - $prefBase); Name = $sym })
        }
        continue
    }
}
Write-Output "Map preferred base: 0x$('{0:X}' -f $prefBase)"

if ($symbols.Count -eq 0) {
    Write-Warning "No symbols parsed from $Map. Dumping first 20 lines so the format can be inspected:"
    Get-Content -LiteralPath $Map -TotalCount 20 | ForEach-Object { "    $_" }
    exit 2
}

$sorted = $symbols | Sort-Object Addr
$addrs  = [UInt64[]]($sorted | ForEach-Object { $_.Addr })

function Resolve-Addr([UInt64]$target) {
    # binary search: greatest Addr <= target
    $lo = 0; $hi = $addrs.Length - 1; $best = -1
    while ($lo -le $hi) {
        $mid = [int](($lo + $hi) / 2)
        if ($addrs[$mid] -le $target) { $best = $mid; $lo = $mid + 1 }
        else { $hi = $mid - 1 }
    }
    if ($best -lt 0) { return $null }
    $s = $sorted[$best]
    [pscustomobject]@{ Name = $s.Name; Offset = $target - $s.Addr }
}

# --- Parse crash addresses from the log -------------------------------------
Write-Output "Resolved $($symbols.Count) symbols from $Map`n"
Write-Output "==== RESOLVED CRASH ($Log) ===="

$reRva = [regex]'RVA\s+0x([0-9A-Fa-f]{4,16})'
$reHex = [regex]'0x([0-9A-Fa-f]{8,16})'
foreach ($line in Get-Content -LiteralPath $Log) {
    if ($line -match 'fault_addr|#\d') {
        # Prefer the ASLR-invariant RVA token; fall back to first absolute hex.
        $hx = $reRva.Match($line)
        if (-not $hx.Success) { $hx = $reHex.Match($line) }
        if ($hx.Success) {
            $va = [Convert]::ToUInt64($hx.Groups[1].Value, 16)
            $r = Resolve-Addr $va
            $label = if ($r) { "{0} +0x{1:X}" -f $r.Name, $r.Offset } else { "<no symbol>" }
            Write-Output ("{0,-48}  {1}" -f $line.Trim(), $label)
            continue
        }
    }
    Write-Output $line
}
Write-Output "==============================="
