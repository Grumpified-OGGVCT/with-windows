param([switch]$CompileOnly)

$ErrorActionPreference = "Stop"
$Root = "C:\Users\gerry\generic_workspace\with-windows"
$LLVM = "$Root\.deps\llvm-22.1.6-windows-x86_64-msvc\bin"
$env:PATH = "$LLVM;$env:PATH"
Set-Location $Root

# Ensure the MSVC/UCRT INCLUDE+LIB environment is present so clang can find
# system headers (e.g. <math.h> used by rt_core_emitted.c). Without this,
# `-target x86_64-pc-windows-msvc` only sees clang's builtin headers and
# rt_core fails with "'math.h' file not found". Import it once from vcvars.
if (-not $env:INCLUDE -or $env:INCLUDE -notmatch 'ucrt') {
    $vcvars = "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
    if (!(Test-Path -LiteralPath $vcvars)) { Write-Error "vcvars64.bat not found: $vcvars" }
    cmd /c "call `"$vcvars`" >nul 2>&1 && set" | ForEach-Object {
        if ($_ -match '^(INCLUDE|LIB|LIBPATH)=(.*)$') {
            Set-Item -Path ("Env:" + $matches[1]) -Value $matches[2]
        }
    }
    Write-Output "Imported MSVC/UCRT environment from vcvars64.bat"
}

# Extract ALL declarations from regenerate with_runtime.h
$all_decls = @{}
$raw = Get-Content runtime\with_runtime.h | Select-String '\s+with_(\w+)\s*\(' | ForEach-Object { $_.Line.Trim() }
foreach ($l in $raw) {
    if ($l -match '^\s*#') { continue }  # skip macro #defines (preamble already has them)
    if ($l -match '\s+with_(\w+)') {
        $all_decls[$matches[1]] = $l
    }
}
Write-Output "Extracted $($all_decls.Count) declarations from with_runtime.h"

# Type definitions preamble
$typePreamble = @'
#ifndef WITH_FILTERED_H
#define WITH_FILTERED_H
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
typedef struct { const uint8_t *ptr; int64_t len; } with_str;
typedef struct { void *ptr; int64_t len; int64_t cap; int64_t elem_size; } with_vec;
typedef struct { bool has_value; int32_t value; } with_option_i32;
typedef struct { bool has_value; int64_t value; } with_option_i64;
typedef struct { bool has_value; with_str value; } with_option_str;
typedef struct Captures Captures;
#define WITH_STR_LIT(s) ((with_str){(const uint8_t*)(s), (int64_t)(sizeof(s) - 1)})
#define with_len(v) ((v).len)
#define with_is_empty(v) (((v).len == 0) ? 1 : 0)
'@

$files = @('rt_core','panic_runtime','regex_runtime','compat_runtime_windows','fiber_stubs','fiber_runtime','channel_runtime','cimport_stubs','llvm_bridge','windows_x86_64')
foreach ($f in $files) {
    $file = "${f}_emitted.c"
    # On Windows, use the CreateProcessA-based compat runtime (from
    # rt/compat_runtime_windows.w) in place of the POSIX fork/execv one (from
    # rt/compat_runtime.w). Both export the identical 12 @[c_export] symbols, so
    # this is a drop-in replacement -- but it is the one that can actually spawn
    # a process, which the link stage needs to invoke the linker. The POSIX
    # variant only "works" on Windows via a fork() stub that always fails
    # (ENOSYS), which silently breaks every build/run/link. See AGENTS.md
    # "No Silent Fallbacks".
    if ($f -eq 'compat_runtime' -and (Test-Path 'compat_runtime_windows_emitted.c')) {
        $file = 'compat_runtime_windows_emitted.c'
    }
    if (!(Test-Path $file)) { Write-Output "SKIP $f (no file)"; continue }

    # Find which declarations THIS file already has
    $own = @(Get-Content $file -TotalCount 1200 | Select-String '\s+with_(\w+)\s*\(' | ForEach-Object { if ($_.Line -match '\s+with_(\w+)') { $matches[1] } } | Select-Object -Unique)
    if ($f -eq 'regex_runtime') {
        $own += @('regex_error_message','regex_capture_name_at','regex_substitute','regex_compile','regex_code_copy','regex_code_free','regex_capture_count','regex_match_spans_alloc','regex_match_spans_alloc_at','regex_capture_name_count','regex_group_name_to_index')
    }

    $filtered = @()
    foreach ($k in $all_decls.Keys) {
        if ($k -notin $own) { $filtered += $all_decls[$k] }
    }

    $hdr = $typePreamble + "`n" + ($filtered -join "`n") + "`n#endif`n"
    $hdrFile = "with_filtered_${f}.h"
    [System.IO.File]::WriteAllText($hdrFile, $hdr)

    Write-Output "  [$f] $($filtered.Count) external, $($own.Count) own"

    if ($CompileOnly) { continue }

    # Windows platform/compat backends declare Win32 funcs as `extern fn`; codegen
    # emits those externs AND a redundant `#include <windows.h>`, which conflict
    # (e.g. emitted `int64_t ExitProcess(uint32_t)` vs SDK `void ExitProcess(UINT)`).
    # The extern fn decls are authoritative, so drop the redundant include. The
    # -Werror=implicit-function-declaration guard then ensures any genuinely
    # undeclared Win32 call fails LOUDLY rather than defaulting to a 32-bit int
    # return that truncates a 64-bit pointer/handle.
    $compileSrc = $file
    $winExtra = @()
    if ($file -match 'windows') {
        $stripped = "stripped_$file"
        $kept = [System.IO.File]::ReadAllLines($file) | Where-Object { $_.Trim() -ne '#include <windows.h>' }
        [System.IO.File]::WriteAllLines("$Root\$stripped", $kept)
        $compileSrc = $stripped
        $winExtra = @('-Werror=implicit-function-declaration','-fms-compatibility','-fms-extensions','-Wno-incompatible-pointer-types')
    }

    $args = @(
        "-c", "-O2", "-target", "x86_64-pc-windows-msvc",
        "-w", "-Wno-everything"
    ) + $winExtra + @(
        "-DWITH_RUNTIME_H=1",
        "-DWITH_BOOTSTRAP_TYPES_H",
        "-include", $hdrFile,
        "-U", "stdout", "-U", "stderr",
        "-I", "runtime", "-I", ".",
        $compileSrc, "-o", "${f}.obj"
    )
    $result = & "clang" @args 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Output "  *** FAILED ***"
        Write-Output $result
        exit 1
    }
    Write-Output "  PASS: ${f}.obj"
}
Write-Output "All runtime compiled."
