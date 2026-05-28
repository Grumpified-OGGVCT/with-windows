# With v0.14.3 Windows Bootstrap Build

This directory contains emitted C source for bootstrapping the With compiler on native Windows x86_64 (no WSL required).

## Prerequisites

- Visual Studio 2019 or 2022 Build Tools (x64)
- Static LLVM SDK (`libclang.lib`, `lld-link.exe`, headers) at `.deps/llvm-22.1.6-windows-x86_64-msvc/`

## Step 1: Build Static LLVM SDK

From PowerShell or CMD:

```cmd
HOST_TAG=windows-x86_64-msvc tools/build-static-llvm-clean.cmd
```

This builds LLVM, Clang, and LLD as static libraries. Takes 2–4 hours.

## Step 2: Compile Bootstrap C Bundle

Once the emitted-C bundle for Windows is produced (via `tools/emit-c-windows.sh` in WSL2), transfer it to Windows and compile:

```cmd
# From the bundle directory, with MSVC x64 environment
compile-bootstrap.cmd . .\out
```

Or manually:

```cmd
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

set LLVM_PREFIX=.deps\llvm-22.1.6-windows-x86_64-msvc
set OUT=out\bootstrap

cl /W3 /O2 /c /Fo"%OUT%\windows_platform.obj" bootstrap\windows_platform.c
cl /W3 /O2 /c /Fo"%OUT%\with_compiler.obj" src\with_compiler.c
cl /W3 /O2 /c /Fo"%OUT%\llvm_bridge.obj" src\llvm_bridge.c
cl /W3 /O2 /c /Fo"%OUT%\clang_bridge.obj" src\clang_bridge.c
cl /W3 /O2 /c /Fo"%OUT%\rt_core.obj" src\rt_core.c
cl /W3 /O2 /c /Fo"%OUT%\panic_runtime.obj" src\panic_runtime.c
cl /W3 /O2 /c /Fo"%OUT%\regex_runtime.obj" src\regex_runtime.c
cl /W3 /O2 /c /Fo"%OUT%\fiber_stubs.obj" src\fiber_stubs.c
cl /W3 /O2 /c /Fo"%OUT%\compat_runtime.obj" src\compat_runtime.c
cl /W3 /O2 /c /Fo"%OUT%\windows_compat_runtime.obj" src\windows_compat_runtime.c

link /SUBSYSTEM:CONSOLE /OPT:REF /OPT:ICF /OUT:"%OUT%\with.exe" ^
  "%OUT%\*.obj" ^
  "%LLVM_PREFIX%\lib\libclang.lib" ^
  kernel32.lib user32.lib bcrypt.lib advapi32.lib shell32.lib ole32.lib
```

## Step 3: Bootstrap Stage Chain

Once `with.exe` is built:

```cmd
# Set the bootstrap binary as the seed compiler
set WITH=out\bootstrap\with.exe

# Build stage1: seed → stage1
WITH=%WITH% make stage1

# Build stage2: stage1 → stage2
WITH=%WITH% make stage2

# Verify fixpoint
WITH=%WITH% make fixpoint
```

Note: This requires Make in your PATH (via MSYS2, Git for Windows, or Cygwin).

## File Inventory

| File | Description |
|------|-------------|
| `src/with_compiler.c` | Emitted C for the With compiler (largest file) |
| `src/llvm_bridge.c` | LLVM-C FFI bridge |
| `src/clang_bridge.c` | libclang FFI bridge |
| `src/rt_core.c` | With runtime core (memory, fibers) |
| `src/panic_runtime.c` | Panic/unwind surface |
| `src/regex_runtime.c` | Regex engine (PCRE-JIT wrapper) |
| `src/fiber_stubs.c` | Non-async fiber lifecycle stubs |
| `src/compat_runtime.c` | Parent process communication (POSIX) |
| `src/windows_compat_runtime.c` | Win32 replacement for process communication |
| `src/windows_platform.c` | Win32 API implementation of all rt_* functions |

## Notes

- The bootstrap binary is temporary. The release binary is the byte-verified output of the With stage chain.
- Once `make fixpoint` passes, the self-hosted compiler replaces the bootstrap.
- `rt_core.c` and `windows_platform.c` are the only platform-specific files in the bundle.
