## Reproduction

```bash
with.exe build :stage1
```

Fails at `bootstrap-llvm-bridge-object`:

```
error: bootstrap-llvm-bridge-object: step 'build' failed with exit code -193
stdout: 0 bytes, stderr: 0 bytes
```

The spawned `with.exe` subprocess crashes before producing output.

## Root cause

`build/selfhost.w` hardcodes `compat_runtime.o` when linking compiler stages. On Windows, it should use `compat_runtime_windows.o` (which implements `CreateProcess`-based subprocess spawning instead of POSIX `fork`/`exec`).

## Additional blocker: embedded stdlib size limit

`build/runtime.w:121` has `if source.len() > 500000` which rejects PCRE2 files:

| File | Size |
|------|------|
| `lib/std/re/pcre2_match.w` | 1,504,495 |
| `lib/std/re/pcre2_compile.w` | 886,151 |
| `lib/std/re/pcre2test.w` | 825,468 |
| `lib/std/re/defs.w` | 697,073 |

Temporary workaround: increased to 2,000,000.

## Environment

- Windows 11 x86_64
- `with.exe` (emit-C bootstrap, v0.13.1)
