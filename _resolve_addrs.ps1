param([string]$Map = "with_dbg.map", [string[]]$Rvas)
$base = [UInt64]0x140000000
$re = [regex]'^\s*[0-9A-Fa-f]{4}:[0-9A-Fa-f]{8}\s+(\S+)\s+([0-9A-Fa-f]{12,16})\b'
$syms = [System.Collections.Generic.List[object]]::new()
foreach ($l in [IO.File]::ReadLines((Resolve-Path $Map))) {
    $m = $re.Match($l)
    if ($m.Success) {
        $va = [Convert]::ToUInt64($m.Groups[2].Value, 16)
        if ($va -ge $base) { $syms.Add([pscustomobject]@{ R = ($va - $base); N = $m.Groups[1].Value }) }
    }
}
$s = $syms | Sort-Object R
function Find([UInt64]$t) {
    $p = $null
    foreach ($x in $s) { if ($x.R -le $t) { $p = $x } else { break } }
    if ($p) { '{0} +0x{1:X}  (start RVA 0x{2:X})' -f $p.N, ($t - $p.R), $p.R } else { '<none>' }
}
foreach ($r in $Rvas) {
    $t = [Convert]::ToUInt64($r, 16)
    "0x$r : $(Find $t)"
}
