## Minimal reproduction

```w
fn main:
    print_i32(42)    # works
    print("hello")   # outputs only newline, no "hello"
```

Run: `with -e 'fn main: print("hello")'`

**Expected:** `hello`
**Actual:** `\n` (empty string body, trailing newline succeeds)

## Narrowed to phase

`--dump-mir` works correctly — the MIR shows the string constant.
`--dump-ir` shows:

```llvm
%str = type { ptr, i64 }
declare void @with_println_str(%str)
call void @with_println_str(%str %3)
```

The 16-byte `{ptr, len}` struct is passed **by value** in the IR. On Win64 ABI (x86_64-pc-windows-msvc), 16-byte structs must be passed **by reference** (hidden pointer in RCX). On System V, they go in two registers.

The TargetMachine triple is correct (`x86_64-pc-windows-msvc`), so the issue is likely in how `Codegen.w` lowers struct arguments for the Win64 calling convention.

## Environment

- Windows 11 x86_64
- LLVM 22.1.6 static, built for Windows MSVC target
- `with.exe` compiled via emit-C bootstrap
- `target triple = "x86_64-pc-windows-msvc"`
