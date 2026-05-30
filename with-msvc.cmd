@echo off
REM with-msvc.cmd — HLF Pattern: explicit env inheritance for spawned subprocesses
REM Ensures MSVC toolchain is available to with.exe and ALL its child processes
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1
set PATH=C:\Users\gerry\generic_workspace\with-windows\.deps\llvm-22.1.6-windows-x86_64-msvc\bin;%PATH%
cd /d C:\Users\gerry\generic_workspace\with-windows
with.exe %*
