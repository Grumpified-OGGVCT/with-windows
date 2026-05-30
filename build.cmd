@echo off
setlocal
set LLVM=C:\Users\gerry\generic_workspace\with-windows\.deps\llvm-22.1.6-windows-x86_64-msvc\bin
set PATH=%LLVM%;%PATH%
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
cd /d C:\Users\gerry\generic_workspace\with-windows
set WD=%CD%

echo === Compiling with.c ===
clang -c -O2 -target x86_64-pc-windows-msvc -w -Wno-everything ^
  -Werror=implicit-function-declaration -Werror=int-conversion ^
  -U stdout -U stderr ^
  -include runtime\wl_decls.h ^
  -I runtime -I . ^
  "..\with-emit-c-windows.bak\with.c" -o with.obj || (echo *** FAIL *** & exit /b 1)
echo PASS

echo === Compiling runtime via per-file filtered headers ===
powershell -NoProfile -ExecutionPolicy Bypass -File build.ps1
if %ERRORLEVEL% NEQ 0 ( echo *** BUILD FAILED *** & exit /b 1 )

echo === Skipping clang_bridge (needs POSIX headers) ===
rem clang_bridge compiled from upstream bundle — needs porting

echo === Compiling windows_platform ===
clang -c -O2 -target x86_64-pc-windows-msvc -w -Wno-everything ^
  -I runtime ^
  bootstrap\windows_platform.c -o windows_platform.obj || (echo *** FAIL *** & exit /b 1)
echo PASS

echo === Compiling embedded_stubs ===
clang -c -O2 -target x86_64-pc-windows-msvc -w -Wno-everything ^
  bootstrap\embedded_stubs.c -o embedded_stubs.obj || (echo *** FAIL *** & exit /b 1)
echo PASS

echo === Compiling embedded_stubs ===
clang -c -O2 -target x86_64-pc-windows-msvc -w -Wno-everything ^
  bootstrap\embedded_stubs.c -o embedded_stubs.obj || (echo *** FAIL *** & exit /b 1)
echo PASS

echo === All compiles passed ===
echo.
echo === Link step ===
set LLDIR=%CD%\.deps\llvm-22.1.6-windows-x86_64-msvc\lib
rem Generate link.rsp with all LLVM libs
rem Exclude LLVM-C.lib: it is a dynamic import stub for LLVM-C.dll. Linking it
rem makes with.exe depend on LLVM-C.dll at load time -> STATUS_DLL_NOT_FOUND
rem (0xC0000135). The static LLVM*.lib archives provide all needed symbols.
rem ntdll.lib is required for RtlGetLastNtStatus used by windows_platform.c.
powershell -NoProfile -Command "$libs = Get-ChildItem $env:LLDIR\*.lib | Where-Object { $_.Name -ne 'LLVM-C.lib' } | ForEach-Object { '\"' + $_.FullName + '\"' }; $objs = @($env:WD+'\with.obj', $env:WD+'\rt_core.obj', $env:WD+'\panic_runtime.obj', $env:WD+'\regex_runtime.obj', $env:WD+'\compat_runtime.obj', $env:WD+'\fiber_runtime.obj', $env:WD+'\channel_runtime.obj', $env:WD+'\cimport_stubs.obj', $env:WD+'\llvm_bridge.obj', $env:WD+'\windows_platform.obj', $env:WD+'\embedded_stubs.obj'); $sys = @('kernel32.lib','user32.lib','bcrypt.lib','ws2_32.lib','advapi32.lib','shell32.lib','ole32.lib','ntdll.lib','libcmt.lib','libvcruntime.lib','libucrt.lib','oldnames.lib'); $lines = '/nologo', '/SUBSYSTEM:CONSOLE' + $objs + $libs + $sys + ('/OUT:' + $env:WD + '\with.exe'); [IO.File]::WriteAllLines($env:WD + '\link.rsp', $lines)"
lld-link @link.rsp
if %ERRORLEVEL% NEQ 0 ( echo *** LINK FAILED *** & exit /b 1 )
echo === SUCCESS: with.exe ===
dir with.exe
