#!/usr/bin/env python3
"""rebuild_seed.py -- Rebuild the With seed compiler from emit-C bundle."""
import subprocess
import sys
import os
from pathlib import Path

LLVM_PREFIX = Path("/mnt/c/Users/gerry/generic_workspace/with-windows/.deps/llvm-22.1.6-host")
BUNDLE = Path("/mnt/c/Users/gerry/AppData/Local/Temp/opencode/bootstrap-bundle/src")
RUNTIME = Path("/mnt/c/Users/gerry/AppData/Local/Temp/opencode/bootstrap-bundle/runtime")
SEED_OUT = Path("/mnt/c/Users/gerry/generic_workspace/with-windows/src/main")
OBJ_DIR = Path("/tmp/with-rebuild/obj")

env = os.environ.copy()
env["PATH"] = str(LLVM_PREFIX / "bin") + ":" + env.get("PATH", "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin")

def run(cmd, cwd=None):
    print(f"  > {' '.join(cmd)}")
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, env=env)
    if r.returncode != 0:
        print(f"  FAILED (rc={r.returncode})")
        for line in r.stderr.splitlines()[-5:]:
            print(f"    {line}")
        return False
    return True

def main():
    OBJ_DIR.mkdir(parents=True, exist_ok=True)
    cflags = ["-std=gnu11", "-O2", "-D_GNU_SOURCE", f"-I{RUNTIME}", f"-I{LLVM_PREFIX / 'include'}"]

    objects = []

    # with_compiler.c includes wl_decls.h
    obj = OBJ_DIR / "with_compiler.o"
    if not run(["gcc"] + cflags + ["-w", "-include", str(RUNTIME / "wl_decls.h"), "-c", str(BUNDLE / "with_compiler.c"), "-o", str(obj)]):
        sys.exit(1)
    objects.append(obj)

    # Runtime modules
    runtime_files = ["clang_bridge", "llvm_bridge", "rt_core", "panic_runtime", "regex_runtime", "fiber_stubs", "compat_runtime", "linux_platform"]
    for name in runtime_files:
        src = BUNDLE / f"{name}.c"
        obj = OBJ_DIR / f"{name}.o"

        # clang_bridge.c has a conflicting 'extern uint8_t* getenv' declaration.
        # Preprocess: replace with an inline wrapper that casts to C types.
        patched_src = OBJ_DIR / f"{name}.patched.c"
        with open(src) as rf:
            src_text = rf.read()
        # Remove conflicting declarations
        src_text = src_text.replace("extern uint8_t* getenv(uint8_t* _1);", "")
        src_text = src_text.replace("extern int mkstemp(uint8_t* _1);", "")
        src_text = src_text.replace("extern int rename(uint8_t* _1, uint8_t* _2);", "")
        src_text = src_text.replace("extern int unlink(uint8_t* _1);", "")
        src_text = src_text.replace("extern uint8_t* realpath(uint8_t* _1, uint8_t* _2);", "")
        with open(patched_src, "w") as wf:
            wf.write(src_text)

        cmd = ["gcc"] + cflags + ["-w"]
        if name in ("rt_core", "fiber_stubs", "panic_runtime", "regex_runtime", "compat_runtime"):
            cmd += ["-DWITH_RUNTIME_H", "-include", str(RUNTIME / "bootstrap_types.h")]
        cmd += ["-c", str(patched_src), "-o", str(obj)]
        if not run(cmd):
            sys.exit(1)
        objects.append(obj)

    # Link with static LLVM
    libs = sorted(LLVM_PREFIX.glob("lib/libclang*.a"))
    libs += sorted(LLVM_PREFIX.glob("lib/libLLVM*.a"))
    libs += sorted(LLVM_PREFIX.glob("lib/liblld*.a"))

    link_cmd = ["g++"] + [str(o) for o in objects]
    link_cmd += ["-Wl,--start-group"] + [str(l) for l in libs] + ["-Wl,--end-group"]
    link_cmd += ["-lpthread", "-ldl", "-lm", "-lc"]
    link_cmd += ["-o", str(SEED_OUT)]

    if not run(link_cmd):
        sys.exit(1)

    # Verify
    result = subprocess.run([str(SEED_OUT), "--version"], capture_output=True, text=True, env=env)
    print(f"[rebuild] Seed version: {result.stdout.strip()}")
    print(f"[rebuild] Seed size: {SEED_OUT.stat().st_size / 1024 / 1024:.1f} MB")
    if result.returncode != 0:
        print(f"[rebuild] Seed --version FAILED: {result.stderr.strip()}")
        sys.exit(1)

if __name__ == "__main__":
    main()
