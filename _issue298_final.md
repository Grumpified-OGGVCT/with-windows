## Confirmed: `process_env()` creates empty environment (no env inheritance)

Diagnosed by applying the **HLF `{**os.environ}` pattern** — HLF's subprocess spawning always inherits the parent's full environment before applying overrides:

```python
# HLF pattern (agent_sandbox.py:319)
cmd_env = dict(os.environ)  # inherit all env vars
if env:
    cmd_env.update(env)      # layer in overrides
```

The With build system does the opposite:

```w
// lib/std/build.w:537 — creates empty env
pub fn process_env() -> ProcessEnv:
    ProcessEnv { vars: Vec.new() }

// build/compiler.w:231 — subprocess gets only WITH_OUT_DIR
var process_env = process_env()
process_env = process_env.set("WITH_OUT_DIR", comp_abs(root, "out"))
```

**Result:** spawned compiler subprocess has no PATH, LIB, or INCLUDE. Can't find `lld-link`, can't load MSVC CRT → crashes with exit code -193, producing 0 bytes of output.

**Fix:** `process_env()` should start from the current process environment (HLF pattern), or when `ProcessEnv` has zero vars, pass `NULL` to `CreateProcessA` so the child inherits the parent's environment block.

**Workaround applied:** `with-msvc.cmd` wrapper ensures the parent process has MSVC environment before spawning, but `process_env()` still strips it for recursive subprocesses.
