# Windows Port: Findings for Upstream

## Status: `with.exe` runs natively on Windows

- 52MB, no DLL dependencies beyond system (kernel32, ntdll, bcrypt)
- `--version`, `--help`, `check`, `--emit-obj` all work
- Scalar I/O works: `with -e "print_i32(42)"` → `42`
- LLVM target triple confirmed: `x86_64-pc-windows-msvc`

## Bug 1: Struct-by-value ABI mismatch (string args broken)

`print("hello")` outputs only `\n` — the string body is empty.

**Root cause:** The `with_str {ptr, len}` struct (16 bytes) is passed by value in LLVM IR:

```llvm
%str = type { ptr, i64 }
declare void @with_println_str(%str)
call void @with_println_str(%str %3)
```

On Win64 ABI, 16-byte structs must be passed **by reference** (hidden pointer in RCX). On System V, they're passed in two registers. The LLVM TargetMachine should handle this lowering, but the struct arrives with `ptr` correct and `len` = 0/garbage at the callee.

**Expected fix:** Audit `Codegen.w`'s struct argument lowering for the Win64 calling convention, or verify `LLVMCreateTargetMachine` with `x86_64-pc-windows-msvc` applies the correct ABI pass.

**Repro:**
```bash
with -e "print("hello")"   # outputs \n only, no "hello"
with -e "print_i32(42)"    # outputs 42 (scalar works)
```

## Bug 2: Build system subprocess spawning fails on Windows

`with build :stage1` (or `:build`) fails at `bootstrap-llvm-bridge-object`:

```
error: bootstrap-llvm-bridge-object: step 'build' failed with exit code -193
stdout: 0 bytes, stderr: 0 bytes
```

The subprocess (spawned `with.exe` for `--emit-obj`) crashes before producing output.

**Likely cause:** The build graph spawns compiler subprocesses via `compat_runtime`. On Windows, `build/selfhost.w` hardcodes `compat_runtime.o` (Linux `fork`/`exec`). It should use `compat_runtime_windows.o` (Windows `CreateProcess`) when `os() == "Windows"`.

## Bug 3: Embedded stdlib source size limit too low

`build/runtime.w:121`: `if source.len() > 500000` rejects PCRE2 files:

| File | Size |
|------|------|
| `lib/std/re/pcre2_match.w` | 1,504,495 |
| `lib/std/re/pcre2_compile.w` | 886,151 |
| `lib/std/re/pcre2test.w` | 825,468 |
| `lib/std/re/defs.w` | 697,073 |

Temporary workaround: increased to 2,000,000.

## Environment Required

`with.exe` needs MSVC library paths (vcvars) and `lld-link.exe` on PATH:

```powershell
$env:PATH = "llvm/bin;$env:PATH"
$env:LIB  = "Windows Kits/um/x64;ucrt/x64;MSVC/lib/x64"
```

## What Works

| Feature | Status |
|---------|--------|
| `--version`, `--help` | ✅ |
| `check` (parse + type-check) | ✅ |
| `--emit-obj` (native LLVM codegen) | ✅ |
| `--emit-c` (C code emission) | ✅ |
| Scalar I/O (`print_i32`) | ✅ |
| String I/O (`print`) | ❌ Bug 1 |
| `c_import` | ❌ Needs clang_bridge |
| Stage chain (`:build`) | ❌ Bug 2 |
