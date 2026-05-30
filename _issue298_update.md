## Additional finding: `process_env()` creates empty environment

`lib/std/build.w:537`:
```w
pub fn process_env() -> ProcessEnv:
    ProcessEnv { vars: Vec.new() }  // empty — no PATH, no LIB, no INCLUDE
```

`build/compiler.w:231-233` spawns subprocess with only `WITH_OUT_DIR`:
```w
var process_env = process_env()
process_env = process_env.set("WITH_OUT_DIR", comp_abs(root, "out"))
```

The spawned subprocess gets no PATH (can't find `lld-link`), no LIB (can't find MSVC CRT), no INCLUDE. Subprocess produces 0 bytes of output → build step fails with "did not produce declared output."

**Fix:** `process_env()` should inherit the current process environment. On `compat_runtime_windows`, when `ProcessEnv` has zero vars, pass `NULL` to `CreateProcessA` so the child inherits the parent's environment block.

**Verification:** Direct `with.exe build --emit-obj rt/llvm_bridge.w` works (exit 0, produces .obj). Same command via build system's `process_env()` fails.
