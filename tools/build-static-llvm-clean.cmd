@echo off
setlocal enabledelayedexpansion

REM With for Windows — Static LLVM SDK Build Script
REM This script builds a static LLVM + Clang + LLD SDK for Windows
REM Requirements: MSVC 2019/2022 BuildTools, cmake, ninja
REM Run from any shell; it loads vcvars64.bat internally

set LLVM_VERSION=22.1.6
set ROOT=C:\Users\gerry\generic_workspace\RecursiveMAS_With_Port\with-windows\.deps
set SRC_DIR=%ROOT%\src
set BUILD_DIR=%ROOT%\build\llvm-%LLVM_VERSION%-windows-x86_64-msvc
set INSTALL_PREFIX=%ROOT%\llvm-%LLVM_VERSION%-windows-x86_64-msvc
set LOG=%ROOT%\build-with-windows.log

REM Clear log
echo [%date% %time%] === With for Windows: Static LLVM Build === > "%LOG%"

REM Load MSVC environment
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat" (
    echo [%date% %time%] Loading vcvars64.bat for VS2019 BuildTools... >> "%LOG%"
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" (
    echo [%date% %time%] Loading vcvars64.bat for VS2022 Community... >> "%LOG%"
    call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
) else (
    echo [%date% %time%] ERROR: vcvars64.bat not found. Install VS2019/2022 BuildTools. >> "%LOG%"
    exit /b 1
)

REM Verify cl.exe is now on PATH
where cl.exe >nul 2>nul
if %errorlevel% neq 0 (
    echo [%date% %time%] ERROR: cl.exe not on PATH after vcvars64.bat >> "%LOG%"
    exit /b 1
)
echo [%date% %time%] cl.exe found: >> "%LOG%"
where cl.exe >> "%LOG%"

REM Verify source exists
set SOURCE_DIR=%SRC_DIR%\llvm-project-%LLVM_VERSION%.src
if not exist "%SOURCE_DIR%" (
    echo [%date% %time%] ERROR: Source not found: %SOURCE_DIR% >> "%LOG%"
    exit /b 1
)

REM Clean and create build dir
if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
mkdir "%BUILD_DIR%"

REM Run cmake configure
echo [%date% %time%] Running cmake configure... >> "%LOG%"
cmake.exe -S "%SOURCE_DIR%\llvm" -B "%BUILD_DIR%" -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_INSTALL_PREFIX="%INSTALL_PREFIX%" ^
  -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded ^
  -DLLVM_ENABLE_PROJECTS="clang;lld" ^
  -DLLVM_TARGETS_TO_BUILD="AArch64;X86" ^
  -DLIBCLANG_BUILD_STATIC=ON ^
  -DLLVM_ENABLE_PIC=OFF ^
  -DBUILD_SHARED_LIBS=OFF ^
  -DLLVM_BUILD_LLVM_DYLIB=OFF ^
  -DLLVM_LINK_LLVM_DYLIB=OFF ^
  -DCLANG_LINK_CLANG_DYLIB=OFF ^
  -DLLVM_INCLUDE_TESTS=OFF ^
  -DLLVM_INCLUDE_BENCHMARKS=OFF ^
  -DLLVM_INCLUDE_EXAMPLES=OFF ^
  -DCLANG_INCLUDE_TESTS=OFF ^
  -DCLANG_BUILD_EXAMPLES=OFF ^
  -DLLVM_ENABLE_ZLIB=OFF ^
  -DLLVM_ENABLE_ZSTD=OFF ^
  >> "%LOG%" 2>&1

if %errorlevel% neq 0 (
    echo [%date% %time%] ERROR: cmake configure failed >> "%LOG%"
    exit /b 1
)
echo [%date% %time%] CMake configure complete. >> "%LOG%"

REM Run ninja build + install
echo [%date% %time%] Starting ninja build + install (this takes 2-4 hours)... >> "%LOG%"
cmake.exe --build "%BUILD_DIR%" --target install --parallel >> "%LOG%" 2>&1

if %errorlevel% neq 0 (
    echo [%date% %time%] ERROR: ninja build failed >> "%LOG%"
    exit /b 1
)
echo [%date% %time%] Build + install complete. >> "%LOG%"

REM Verify outputs
set LIBCLANG=%INSTALL_PREFIX%\lib\libclang.lib
set NM=%INSTALL_PREFIX%\bin\llvm-nm.exe

if not exist "%LIBCLANG%" (
    echo [%date% %time%] ERROR: libclang.lib not found at %LIBCLANG% >> "%LOG%"
    exit /b 1
)
echo [%date% %time%] libclang.lib verified: %LIBCLANG% >> "%LOG%"

if not exist "%NM%" (
    echo [%date% %time%] ERROR: llvm-nm.exe not found at %NM% >> "%LOG%"
    exit /b 1
)

"%NM%" -g "%LIBCLANG%" | findstr "clang_createIndex" >nul
if %errorlevel% neq 0 (
    echo [%date% %time%] ERROR: clang_createIndex not exported from libclang.lib >> "%LOG%"
    exit /b 1
)
echo [%date% %time%] clang_createIndex verified in libclang.lib >> "%LOG%"

echo [%date% %time%] === BUILD SUCCESS === >> "%LOG%"
echo [%date% %time%] Install prefix: %INSTALL_PREFIX% >> "%LOG%"
echo. >> "%LOG%"
echo Next steps: >> "%LOG%"
echo   1. Set LLVM_PREFIX=%INSTALL_PREFIX% >> "%LOG%"
echo   2. Verify with: %%LLVM_PREFIX%%\bin\llvm-nm.exe -g %%LLVM_PREFIX%%\lib\libclang.lib ^| findstr clang_createIndex >> "%LOG%"
echo   3. Proceed to bootstrap C compilation >> "%LOG%"

endlocal
