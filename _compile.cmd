@echo off
setlocal
set LLVM=C:\Users\gerry\generic_workspace\with-windows\.deps\llvm-22.1.6-windows-x86_64-msvc\bin
set PATH=%LLVM%;%PATH%
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat" >nul 2>&1

cd /d C:\Users\gerry\generic_workspace\with-windows

echo === Compiling with.c (clang, -w like upstream gcc -w) ===
clang -c -O2 -target x86_64-pc-windows-msvc ^
  -w -Wno-everything ^
  -U stdout -U stderr ^
  -include "%CD%\runtime\wl_decls.h" ^
  -I "%CD%\runtime" ^
  -I "%CD%" ^
  "%CD%\..\with-emit-c-windows.bak\with.c" ^
  -o "%CD%\with.obj"
if %ERRORLEVEL% NEQ 0 (
  echo *** COMPILE FAILED ***
  exit /b 1
)
echo PASS: with.obj

rem All runtime implementation files: use normal with_runtime.h, no hacks
for %%f in (rt_core panic_runtime regex_runtime compat_runtime fiber_stubs fiber_runtime channel_runtime) do (
  echo === Compiling %%f_emitted.c ===
  clang -c -O2 -target x86_64-pc-windows-msvc ^
    -w -Wno-everything ^
    -fms-compatibility -fms-extensions ^
    -Wno-incompatible-pointer-types ^
    -U stdout -U stderr ^
    -I "%CD%\runtime" ^
    -I "%CD%" ^
    "%CD%\%%f_emitted.c" ^
    -o "%CD%\%%f.obj" || (echo *** COMPILE FAILED *** & exit /b 1)
  echo PASS: %%f.obj
)

echo === Compiling windows_platform.c ===
clang -c -O2 -target x86_64-pc-windows-msvc ^
  -w -Wno-everything ^
  -I "%CD%\runtime" ^
  "%CD%\bootstrap\windows_platform.c" ^
  -o "%CD%\windows_platform.obj"
if %ERRORLEVEL% NEQ 0 (
  echo *** COMPILE FAILED ***
  exit /b 1
)
echo PASS: windows_platform.obj

echo === All compiles passed ===
echo === Link step ===
set LLDIR=%CD%\.deps\llvm-22.1.6-windows-x86_64-msvc\lib
lld-link /nologo /SUBSYSTEM:CONSOLE ^
  "%CD%\with.obj" ^
  "%CD%\rt_core.obj" ^
  "%CD%\panic_runtime.obj" ^
  "%CD%\regex_runtime.obj" ^
  "%CD%\compat_runtime.obj" ^
  "%CD%\fiber_stubs.obj" ^
  "%CD%\fiber_runtime.obj" ^
  "%CD%\channel_runtime.obj" ^
  "%CD%\windows_platform.obj" ^
  "%LLDIR%\libclang.lib" ^
  "%LLDIR%\clangFrontend.lib" ^
  "%LLDIR%\clangCodeGen.lib" ^
  "%LLDIR%\clangBasic.lib" ^
  "%LLDIR%\clangLex.lib" ^
  "%LLDIR%\clangParse.lib" ^
  "%LLDIR%\clangSema.lib" ^
  "%LLDIR%\clangDriver.lib" ^
  "%LLDIR%\clangAST.lib" ^
  "%LLDIR%\LLVMCore.lib" ^
  "%LLDIR%\LLVMSupport.lib" ^
  "%LLDIR%\LLVMCodeGen.lib" ^
  "%LLDIR%\LLVMTarget.lib" ^
  "%LLDIR%\LLVMX86CodeGen.lib" ^
  "%LLDIR%\LLVMX86Desc.lib" ^
  "%LLDIR%\LLVMX86Info.lib" ^
  "%LLDIR%\LLVMSelectionDAG.lib" ^
  "%LLDIR%\LLVMAsmPrinter.lib" ^
  "%LLDIR%\LLVMMC.lib" ^
  "%LLDIR%\LLVMAnalysis.lib" ^
  "%LLDIR%\LLVMBitWriter.lib" ^
  "%LLDIR%\LLVMBitReader.lib" ^
  "%LLDIR%\LLVMTransformUtils.lib" ^
  "%LLDIR%\LLVMScalarOpts.lib" ^
  "%LLDIR%\LLVMipo.lib" ^
  "%LLDIR%\LLVMInstCombine.lib" ^
  kernel32.lib user32.lib bcrypt.lib ws2_32.lib advapi32.lib shell32.lib ole32.lib ^
  /OUT:"%CD%\with.exe"
