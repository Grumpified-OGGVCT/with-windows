# With for Windows — Porting Tracker

**Goal:** Produce a native Windows x86_64 build of the With compiler (`with.exe`), self-hosting with zero dynamic dependency on LLVM, Clang, or libclang.

**Upstream:** https://github.com/withlang-dev/with (v0.14.3)
**Fork:** https://github.com/Grumpified-OGGVCT/with-windows
**Target:** Windows 11 Home (and all Windows editions)

---

## Strategy: Emit-C Bootstrap (Path B)

No Windows seed compiler exists. We use the upstream emit-C bootstrap bundle (`with-bootstrap-c-v0.14.3.tar.zst`) — the compiler emitted to C source — and compile it on Windows against a static LLVM SDK.

**Stage chain (once bootstrap binary works):**
```
emit-C bootstrap → with.exe (seed)
seed build :build → stage1
stage1 build :build → stage2
stage2 build :build → stage3
stage2 == stage3 (fixpoint)
```

---

## Current Status

| Milestone | Status | Notes |
|-----------|--------|-------|
| Deep codebase audit | **✅ DONE** | 5 agents, 26+ files, full gap inventory |
| Static LLVM SDK build | **🔄 IN PROGRESS** | `build-static-llvm-clean.cmd` running; ETA 2-4 hours |
| Compile bootstrap C bundle | ⏳ BLOCKED on LLVM SDK | |
| Create `rt/windows_x86_64.w` | ⏳ NOT STARTED | |
| Create fiber assembly for Windows | ⏳ NOT STARTED | |
| Fix build system for Windows | ⏳ NOT STARTED | `build.w`, `build/compiler.w`, `Link.w` |
| Stage chain + fixpoint | ⏳ NOT STARTED | |
| Release packaging | ⏳ NOT STARTED | |

---

## What Already Works (No Changes Needed)

- **Frontend**: Lexer, Parser, Sema — platform-agnostic
- **MIR lower**: Platform-agnostic
- **C backend** (`CCodegen.w`): Emits portable C11
- **Build target enum**: `windows_x86_64 = 5` already defined in `BuildGraphKinds.w`
- **Host OS detection**: `os() == "Windows"` already recognized in `lib/std/sysinfo.w`
- **`build/selfhost.w`**: Already has `else if os() == "Windows": host = BuildTarget.windows_x86_64`

---

## Known Gaps (from squad audit)

### 1. Runtime Backend — MISSING `rt/windows_x86_64.w`

The platform backend must implement 31 `@[c_export("rt_...")]` functions. Reference: `rt/linux_x86_64.w` (642 lines, 31 exports).

**Core `rt_*` contract (13 functions):**
| Function | Linux | Windows target |
|----------|-------|----------------|
| `rt_write` | `write()` | `WriteFile()` |
| `rt_read` | `read()` | `ReadFile()` |
| `rt_open` | `open()` | `CreateFileW()` |
| `rt_close` | `close()` | `CloseHandle()` |
| `rt_seek` | `lseek()` | `SetFilePointerEx()` |
| `rt_stat` | `stat()` | `GetFileAttributesExW()` |
| `rt_getcwd` | `getcwd()` | `GetCurrentDirectoryW()` |
| `rt_mmap` | `mmap()` | `VirtualAlloc()` |
| `rt_munmap` | `munmap()` | `VirtualFree()` |
| `rt_exit` | `_exit()` | `ExitProcess()` |
| `rt_args` | stored argc/argv | `GetCommandLineW()` + parse |
| `rt_clock_ns` | `clock_gettime()` | `QueryPerformanceCounter()` |
| `rt_getenv` | `getenv()` | `GetEnvironmentVariableW()` |

**Error convention:** Negative return = negated errno. Windows has no EINTR.

**Open flag translation:** Canonical flags → Windows `dwDesiredAccess`/`dwCreationDisposition`.

**Stat struct layout:** `RtStatBuf` has fixed offsets: `size@0`, `is_dir@8`, `is_file@12`, `modified_ns@16`. Windows backend must extract from `WIN32_FILE_ATTRIBUTE_DATA` or `BY_HANDLE_FILE_INFORMATION` and write into these offsets.

**Page size:** `rt_fiber_page_size` → `GetSystemInfo().dwPageSize` (default 4096).

**Random:** `rt_fill_random` → `BCryptGenRandom` or `RtlGenRandom`.

**Threading:** `rt_thread_spawn/join` → `CreateThread`/`WaitForSingleObject`.

**Signals:** `rt_fiber_install_signal_handlers` → no-op or Vectored Exception Handling.

**Sysinfo:** `rt_sysinfo_os` → `"Windows"`, `rt_sysinfo_arch` → `"x86_64"`.

### 2. Fiber Assembly — MISSING `runtime/fiber_asm_windows_x86_64.s` or `.asm`

`fiber_asm_linux_x86_64.s` uses SysV AMD64 ABI. Windows uses Microsoft x64 calling convention:
- Args in RCX, RDX, R8, R9 (not RDI, RSI, RDX)
- Same callee-saved registers (RBX, RBP, R12-R15) + XMM6-XMM15
- 16-byte stack alignment

Approach options:
- Write MASM `.asm` with Microsoft calling convention (preferred for MSVC/native build)
- Use `#ifdef _WIN64` in generic `.s` (if using clang, which accepts GAS syntax)

### 3. Linker — `src/compiler/Link.w`

**Currently hard-fails on Windows:**
```
link_stage_host_platform_runtime_object() → "unsupported host runtime platform"
link_stage_make_llvm_link_command() → "unsupported host LLVM linker platform"
```

**Required additions:**
- `link_stage_make_windows_llvm_link_command()`: Use `lld-link.exe` or `link.exe` with COFF/PE output
- Windows CRT objects: `kernel32.lib`, `ucrt.lib`, `vcruntime.lib`, `msvcrt.lib`
- No `-lc`, `-lm`, `-lpthread`, `-ldl` on Windows
- Object extension: `.obj` (not `.o`) for MSVC
- Dead code elimination: `/OPT:REF` instead of `-Wl,--gc-sections`

### 4. Build System — `build.w`, `build/compiler.w`, `build/selfhost.w`, `build/emit_c.w`

| File | Current | Needed |
|------|---------|--------|
| `build.w` `host_runtime_spec()` | Linux/Darwin only | Add Windows branch |
| `build.w` `release_asset_for_host()` | Darwin/Linux only | Add `with-windows-x86_64` |
| `build/compiler.w` `run_generate_llvm_link_metadata_action()` | Hard-fails for Windows | Add Windows response file generation |
| `build/compiler.w` `comp_llvm_lld_tool()` | `ld.lld`/`ld64.lld` only | Add `lld-link.exe` |
| `build/compiler.w` `comp_libclang_path()` | `.dylib`/`.a` only | Add `.lib` |
| `build/compiler.w` `comp_resolve_seed_compiler()` | PATH `:` separator, `"/with"` | `;` separator, `\with.exe` |
| `build/emit_c.w` `emitc_host_platform_runtime_object()` | Returns `""` for Windows | Return `rt_windows_x86_64.obj` |
| `build/emit_c.w` `emitc_push_system_libs()` | `-lc -lm` | Skip on Windows |
| `build/emit_c.w` `emitc_c_compiler()` | `"cc"` fallback | `"clang"` or detect `cl.exe` |
| `build/selfhost.w` `bs_host_platform_runtime_object()` | Same gap | Same fix |

### 5. C Backend (`CCodegen.w`)

One MSVC incompatibility found:
- `__typeof__` GNU extension (used in `storage_copy_assignment`) not supported by MSVC.
- Fix: Use explicit type or C11 `_Generic` instead.

### 6. Makefile

The `Makefile` is essentially a Bash script. For native Windows builds, we need:
- `build.ps1` or equivalent PowerShell build script
- `WITH_REPO_LOCK` using PowerShell mutex instead of `mkdir` + `kill -0`
- Seed download with `Invoke-WebRequest` or `curl.exe`
- `.exe` extension on all binaries

### 7. Path Separators

All `.w` build system files use `/` as path separator. On Windows, `ToolFs` may normalize this, but we need to verify. If not, we need platform-aware path join functions.

---

## Files Created / Modified in This Fork

| File | Status | Description |
|------|--------|-------------|
| `lib/std/math.w` | **M** | Added `sqrt_f32` (Issue 1 fix) |
| `test/behavior/std_math_sqrt_f32.w` | **A** | Regression test for `sqrt_f32` |
| `WITH_BUGS.md` | **A** | Verified bugs tracker |
| `tools/build-static-llvm-clean.cmd` | **A** | Self-contained static LLVM build script |
| `WINDOWS_PORT.md` | **A** | This document |

---

## Next Steps (In Order)

1. **Wait for static LLVM build** — `tools/build-static-llvm-clean.cmd` running
2. **Verify LLVM SDK** — `llvm-nm -g libclang.lib | findstr clang_createIndex`
3. **Compile bootstrap C bundle** — use `cl.exe` to compile emitted C + static LLVM SDK
4. **Bootstrap `with.exe`** — first working Windows binary
5. **Bootstrap stage chain** — verify `with.exe check hello.w`, `with.exe run hello.w`
6. **Create `rt/windows_x86_64.w`** — Win32 API platform backend
7. **Create `runtime/fiber_asm_windows_x86_64.asm`** — Windows x64 context switch
8. **Patch build system** — `build.w`, `build/compiler.w`, `Link.w` for Windows
9. **Full stage chain** — seed → stage1 → stage2 → stage3 → fixpoint
10. **Zero dynamic deps check** — `dumpbin /dependents` on final binary
11. **Release packaging** — `scripts/package-windows-x86_64.ps1`, CI update

---

## References

- `rt/linux_x86_64.w` — Primary template for platform backend
- `rt/darwin_aarch64.w` — Alternative backend pattern
- `rt/rt_core.w` — Runtime core contract (first 500 lines)
- `runtime/fiber_asm_linux_x86_64.s` — Fiber context switch template
- `src/compiler/Link.w` — Linker policy
- `build.w` — Build graph
- `docs/with-bootstrap-runbook.md` — Bootstrap procedure
- `docs/with_for_ai.md` — Language primer
- `docs/with-build.md` — Build system docs
- `docs/runtime.md` — Runtime backend mapping table

---

## Communication Log

- **2026-05-27:** Eric (With lead dev) confirmed static LLVM build is prerequisite. Estimated 3-4 hours first time. Offered call support if blocked. Target: any Windows edition (Home, Pro, etc.). No WSL required.

---

*Last updated: 2026-05-27*
