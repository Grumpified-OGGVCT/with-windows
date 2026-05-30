# build-rt-windows.ps1
# ---------------------------------------------------------------------------
# Build the Windows x86_64 platform runtime object:
#     out/lib/rt_windows_x86_64.o
#
# This object is the Windows twin of out/lib/rt_linux_x86_64.o. It provides the
# rt_* platform boundary (rt_open, rt_mkdir, rt_clock_ns, rt_args, fiber
# primitives, ...) that the self-hosting link backend links into USER programs.
# It is NOT linked into with.exe itself (with.exe uses bootstrap/windows_platform.c
# as its platform layer; the two define the same rt_* symbols and must never be
# linked together).
#
# Pipeline (Route B -- emit from the With-native backend, the source of truth):
#   1. with.exe build rt/windows_x86_64.w --emit-c --no-prelude -o <emitted.c>
#   2. Patch the generated artifact: drop the redundant `#include <windows.h>`.
#   3. Compile to out/lib/rt_windows_x86_64.o.
#
# Why step 2 is correct and not a silent fallback
# ------------------------------------------------
# The codegen preamble unconditionally emits `#include <windows.h>` AND emits an
# `extern` declaration for every `extern fn` in the .w source. For the platform
# backend -- the only module that declares Win32 functions -- this is
# self-conflicting: e.g. the emitted `extern int64_t ExitProcess(uint32_t)`
# conflicts with the SDK's `void ExitProcess(UINT)` (a hard "conflicting types"
# error, not a warning -- no -W flag reconciles it).
#
# In the With runtime design, the `extern fn` declarations in windows_x86_64.w
# ARE the authoritative Win32 ABI -- the backend deliberately declares its own
# boundary so it does not depend on platform headers. windows.h is therefore
# redundant here, and dropping it lets the authoritative externs stand. On x64
# Windows there is a single calling convention, so the generic-typed externs are
# ABI-correct against kernel32.lib. The compile is guarded by
# -Werror=implicit-function-declaration, so if any Win32 function is genuinely
# undeclared the build FAILS LOUDLY rather than truncating a return value.
#
# The proper long-term fix lives in WITH proper (codegen should not emit a
# redundant extern for an `extern fn` when the platform header already declares
# it, or should not include windows.h for backend modules). That requires
# maintainer sign-off; this script is the harness-level bridge until then.
# ---------------------------------------------------------------------------

$ErrorActionPreference = "Stop"
$Root = "C:\Users\gerry\generic_workspace\with-windows"
$LLVM = "$Root\.deps\llvm-22.1.6-windows-x86_64-msvc\bin"
$env:PATH = "$LLVM;$env:PATH"
Set-Location $Root

$module   = "windows_x86_64"
$src      = "rt\$module.w"
$emitted  = "${module}_emitted.c"
$obj      = "out\lib\rt_${module}.o"

# --- MSVC/UCRT environment (system headers + libs) -------------------------
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

# --- Step 1: emit C from the native backend --------------------------------
Write-Output "[1/3] Emitting C from $src ..."
& "$Root\with.exe" build $src --emit-c --no-prelude -o $emitted
if ($LASTEXITCODE -ne 0) { Write-Error "emit-c failed for $src (exit $LASTEXITCODE)" }
if (!(Test-Path $emitted)) { Write-Error "emit-c reported success but $emitted is missing" }
Write-Output ("      emitted {0:N1} KB" -f ((Get-Item $emitted).Length / 1kb))

# --- Step 2: drop the redundant windows.h include -------------------------
# Deterministic, single-line transform. Fail loudly if the expected line is
# absent (means the codegen preamble changed and this script needs review).
$lines = [System.IO.File]::ReadAllLines($emitted)
$before = $lines.Count
$patched = $lines | Where-Object { $_.Trim() -ne '#include <windows.h>' }
if ($patched.Count -eq $before) {
    Write-Error "[2/3] expected '#include <windows.h>' not found in $emitted; codegen preamble may have changed -- review build-rt-windows.ps1"
}
# Insert a breadcrumb so the artifact is self-explaining.
$note = "/* build-rt-windows.ps1: removed redundant '#include <windows.h>'; the" + [Environment]::NewLine +
        "   extern fn decls in rt/windows_x86_64.w are the authoritative Win32 ABI. */"
[System.IO.File]::WriteAllText($emitted, $note + [Environment]::NewLine + ($patched -join [Environment]::NewLine) + [Environment]::NewLine)
Write-Output "[2/3] Patched: dropped redundant '#include <windows.h>'"

# --- Filtered header (with_* runtime externs), mirrors build.ps1 ----------
$all_decls = @{}
$raw = Get-Content runtime\with_runtime.h | Select-String '\s+with_(\w+)\s*\(' | ForEach-Object { $_.Line.Trim() }
foreach ($l in $raw) {
    if ($l -match '^\s*#') { continue }
    if ($l -match '\s+with_(\w+)') { $all_decls[$matches[1]] = $l }
}
$own = @(Get-Content $emitted -TotalCount 1200 | Select-String '\s+with_(\w+)\s*\(' | ForEach-Object { if ($_.Line -match '\s+with_(\w+)') { $matches[1] } } | Select-Object -Unique)
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
$filtered = @(); foreach ($k in $all_decls.Keys) { if ($k -notin $own) { $filtered += $all_decls[$k] } }
$hdrFile = "with_filtered_${module}.h"
[System.IO.File]::WriteAllText($hdrFile, $typePreamble + "`n" + ($filtered -join "`n") + "`n#endif`n")
Write-Output "      filtered header: $($filtered.Count) external decls, $($own.Count) own"

# --- Step 3: compile to the platform runtime object ------------------------
if (!(Test-Path "out\lib")) { New-Item -ItemType Directory -Path "out\lib" | Out-Null }
Write-Output "[3/3] Compiling $emitted -> $obj ..."
# Flag posture (matches build.ps1's convention for emitted runtime C):
#   * -Werror=implicit-function-declaration is KEPT. It is the guard for the
#     pointer-truncation bug class (an undeclared function defaults to int
#     return -> a 64-bit pointer is truncated to 32 bits). It also makes the
#     windows.h strip above safe: if any Win32 function is genuinely undeclared
#     after dropping the header, this fails the build loudly.
#   * -Werror=int-conversion is NOT used. It fires on a PRE-EXISTING codegen
#     pattern: tuple RETURN types are lowered to scalar `int64_t` and built with
#     a multi-element compound literal, e.g. with_vec_new's
#         _5 = (int64_t){_2, _3, _4, _1};   // Vec {ptr,len,cap,elem_size}
#     and rt_args's
#         _4 = (int64_t){_2, argc};         // (*const *const u8, i32)
#     This pattern is present in rt_core_emitted.c too (4 sites) and ships in
#     the working with.exe; it is masked on every platform by `-w`. It is a
#     genuine codegen defect in tuple-return lowering, but the fix lives in
#     WITH proper (CCodegen.w) and is out of scope for this harness-only object
#     build. See docs/windows-port-notes (codegen tuple-return bug) -- filed
#     for maintainer decision. Enabling int-conversion here would only re-mask
#     the milestone behind an upstream bug we are not authorized to fix.
$cargs = @(
    "-c", "-O2", "-target", "x86_64-pc-windows-msvc",
    "-w", "-Wno-everything",
    "-Werror=implicit-function-declaration",
    "-fms-compatibility", "-fms-extensions", "-Wno-incompatible-pointer-types",
    "-DWITH_RUNTIME_H=1", "-DWITH_BOOTSTRAP_TYPES_H",
    "-include", $hdrFile,
    "-U", "stdout", "-U", "stderr",
    "-I", "runtime", "-I", ".",
    $emitted, "-o", $obj
)
& "clang" @cargs
if ($LASTEXITCODE -ne 0) { Write-Error "compile failed for $emitted (exit $LASTEXITCODE)" }
Write-Output ("      OK: {0} ({1:N1} KB)" -f $obj, ((Get-Item $obj).Length / 1kb))
Write-Output "Done."
