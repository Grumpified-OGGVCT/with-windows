@echo off
rem smoke-test.cmd -- Quick smoke test for bootstrap with.exe
rem Usage: smoke-test.cmd ^<with_exe_path^>

setlocal EnableDelayedExpansion
set "WITH_EXE=%~1"
if "%WITH_EXE%"=="" set "WITH_EXE=%CD%\out\with.exe"

if not exist "%WITH_EXE%" (
    echo ERROR: with.exe not found at %WITH_EXE%
    exit /b 1
)

echo [smoke] With binary: %WITH_EXE%

rem 1. --version should print something
echo [smoke] Test 1: --version
"%WITH_EXE%" --version >NUL 2>NUL
if errorlevel 1 (
    echo [smoke] FAIL: --version returned error
    exit /b 1
)
echo [smoke] PASS: --version

rem 2. Simple hello-world .w test
echo [smoke] Test 2: hello-world compile
set "TMP_DIR=%TEMP%\with-smoke-%RANDOM%"
mkdir "%TMP_DIR%"
echo fn main() -> i32 { print("Hello, Windows!\n"); return 0 } > "%TMP_DIR%\hello.w"
"%WITH_EXE%" check "%TMP_DIR%\hello.w" >NUL 2>NUL
if errorlevel 1 (
    echo [smoke] FAIL: hello-world check
    rmdir /s /q "%TMP_DIR%"
    exit /b 1
)
echo [smoke] PASS: hello-world check

rem 3. Arithmetic smoke
echo [smoke] Test 3: arithmetic
set "ARITH_FILE=%TMP_DIR%\arith.w"
echo fn add(a: i64, b: i64) -> i64 { return a + b } > "%ARITH_FILE%"
echo fn main() -> i32 { let x = add(2, 3); assert x == 5; return 0 } >> "%ARITH_FILE%"
"%WITH_EXE%" check "%ARITH_FILE%" >NUL 2>NUL
if errorlevel 1 (
    echo [smoke] FAIL: arithmetic check
    rmdir /s /q "%TMP_DIR%"
    exit /b 1
)
echo [smoke] PASS: arithmetic check

rmdir /s /q "%TMP_DIR%" >NUL 2>NUL

echo [smoke] All tests passed.
exit /b 0
