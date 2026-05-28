@echo off
rem compile-bootstrap.cmd -- Compile With bootstrap bundle on Windows with MSVC + static LLVM SDK
rem Usage: compile-bootstrap.cmd ^<bundle_dir^> [output_dir]
rem Requires: Visual Studio 2022 Build Tools + Windows SDK, static LLVM SDK at .deps/llvm-*-msvc/

setlocal EnableDelayedExpansion

set "BUNDLE_DIR=%~1"
set "OUT_DIR=%~2"
if "%BUNDLE_DIR%"=="" (
    echo Usage: compile-bootstrap.cmd ^<bundle_dir^> [output_dir]
    exit /b 1
)
if "%OUT_DIR%"=="" set "OUT_DIR=%CD%\out\bootstrap"

rem ── Find static LLVM SDK ──────────────────────────────────────────
for /d %%D in (".deps\llvm-*-windows-x86_64-msvc") do set "LLVM_SDK=%%~fD"
if "%LLVM_SDK%"=="" (
    echo ERROR: Static LLVM SDK not found in .deps\llvm-*-windows-x86_64-msvc
    exit /b 1
)

echo [bootstrap] LLVM SDK: %LLVM_SDK%
echo [bootstrap] Bundle dir: %BUNDLE_DIR%
echo [bootstrap] Output dir: %OUT_DIR%

if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

rem ── MSVC environment ───────────────────────────────────────────────
set "VCVARS=%ProgramFiles(x86)%\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS%" set "VCVARS=%ProgramFiles(x86)%\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS%" set "VCVARS=%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS%" set "VCVARS=%ProgramFiles%\Microsoft Visual Studio\2022\Professional\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS%" set "VCVARS=%ProgramFiles%\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS%" (
    echo ERROR: vcvars64.bat not found. Install Visual Studio Build Tools.
    exit /b 1
)
rem We cannot call vcvars64.bat from inside this batch script and continue in the same script
rem easily. Instead, we generate a temporary script that calls vcvars64.bat then compiles.
set "TMP_BAT=%TEMP%\with-bootstrap-compile-%RANDOM%.bat"
(
    echo @echo off
    echo call "%VCVARS%"
    echo if errorlevel 1 exit /b 1
    echo cd /d "%CD%"
    echo set "OUT_DIR=%OUT_DIR%"
    echo set "BUNDLE_DIR=%BUNDLE_DIR%"
    echo set "LLVM_SDK=%LLVM_SDK%"
    echo call :do_compile
    echo exit /b %%errorlevel%%
    echo.
    echo :do_compile
    echo echo [bootstrap] Compiling windows_platform.c ...
    echo cl /nologo /W4 /O2 /c /Fo"%%OUT_DIR%%\windows_platform.obj" "bootstrap\windows_platform.c"
    echo if errorlevel 1 exit /b 1
    echo.
    echo echo [bootstrap] Compiling emitted C source...
    echo set "OBJ_LIST=%%OUT_DIR%%\windows_platform.obj"
    echo for %%%%F in ("%%BUNDLE_DIR%%\*.c") do (
    echo     echo   ^^^> %%%%~nF.c
    echo     cl /nologo /W3 /O2 /c /Fo"%%OUT_DIR%%\%%%%~nF.obj" "%%%%F" 2^>nul
    echo     if errorlevel 1 (
    echo         rem Some emitted C may fail with W4; retry with W0
    echo         cl /nologo /W0 /O2 /c /Fo"%%OUT_DIR%%\%%%%~nF.obj" "%%%%F"
    echo         if errorlevel 1 exit /b 1
    echo     ^)
    echo     set "OBJ_LIST=%%OBJ_LIST%% %%OUT_DIR%%\%%%%~nF.obj"
    echo ^)
    echo.
    echo echo [bootstrap] Linking with.exe ...
    echo link /nologo /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /OUT:"%%OUT_DIR%%\with.exe" %%OBJ_LIST%% ^^
    echo     "%%LLVM_SDK%%\lib\libclang.lib" ^^
    echo     kernel32.lib user32.lib bcrypt.lib advapi32.lib shell32.lib ole32.lib
    echo if errorlevel 1 exit /b 1
    echo.
    echo echo [bootstrap] Success: %%OUT_DIR%%\with.exe
    echo exit /b 0
) > "%TMP_BAT%"

call "%TMP_BAT%"
set "RC=%errorlevel%"
del "%TMP_BAT%" 2>nul
exit /b %RC%
