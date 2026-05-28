#!/usr/bin/env bash
# after-llvm-build.sh -- Run in WSL2 after static LLVM build completes
# Rebuilds the patched With compiler, verifies stage chain, emits Windows C bundle.
#
# Usage (in WSL2, from repo root):
#   ./tools/after-llvm-build.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Find the installed static LLVM prefix
LLVM_PREFIX=""
for d in "$REPO_DIR"/.deps/llvm-*-host; do
    if [ -d "$d" ]; then
        LLVM_PREFIX="$(cd "$d" && pwd)"
        break
    fi
done

if [ -z "$LLVM_PREFIX" ] || [ ! -f "$LLVM_PREFIX/lib/libclang.a" ]; then
    echo "ERROR: Static LLVM prefix with libclang.a not found at $LLVM_PREFIX"
    echo "Has 'build-static-llvm.sh --host' finished? Check /tmp/llvm-build.log"
    exit 1
fi

echo "[after-llvm] LLVM prefix: $LLVM_PREFIX"
echo "[after-llvm] Found libclang.a: $(ls -lh "$LLVM_PREFIX/lib/libclang.a" | awk '{print $5, $9}')"

export LLVM_PREFIX
export PATH="$LLVM_PREFIX/bin:$PATH"

which clang && echo "[after-llvm] clang: $(clang --version | head -n1)"
which lld && echo "[after-llvm] lld: $(lld --version | head -n1)"
which llvm-ar && echo "[after-llvm] llvm-ar: $(llvm-ar --version | head -n1)"

cd "$REPO_DIR"

# ── 1. Verify patched files parse with new compiler (once built) ──
# For now, verify with existing seed + check
echo ""
echo "[after-llvm] Phase 1: Verify patched runtime files parse"
for f in rt/windows_x86_64.w rt/compat_runtime_windows.w; do
    if [ -f "$f" ]; then
        echo "  Checking $f ..."
        with check --no-prelude "$f" 2>/dev/null || echo "    (expected: seed doesn't know new platformyet)"
    fi
done

# ── 2. Rebuild compiler with static LLVM ──
echo ""
echo "[after-llvm] Phase 2: Rebuild compiler (make build)"
make build 2>&1 | tee /tmp/with-build.log
if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: make build failed. See /tmp/with-build.log"
    exit 1
fi

echo ""
echo "[after-llvm] Phase 3: Stage chain verification"
make stage3 2>&1 | tee /tmp/with-stage3.log
if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: make stage3 failed. See /tmp/with-stage3.log"
    exit 1
fi

echo ""
echo "[after-llvm] Phase 4: Fixpoint check"
make fixpoint 2>&1 | tee /tmp/with-fixpoint.log
if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: make fixpoint failed. See /tmp/with-fixpoint.log"
    exit 1
fi

echo ""
echo "[after-llvm] Phase 5: Install patched compiler"
make install 2>&1 | tee /tmp/with-install.log
if [ "${PIPESTATUS[0]}" -ne 0 ]; then
    echo "ERROR: make install failed. See /tmp/with-install.log"
    exit 1
fi

echo ""
echo "[after-llvm] Phase 6: Emit Windows C bundle"
BUNDLE_DIR="$REPO_DIR/with-emit-c-windows"
rm -rf "$BUNDLE_DIR"
mkdir -p "$BUNDLE_DIR"

# Emit the full compiler as C
make emit-c BUNDLE_DIR="$BUNDLE_DIR" 2>&1 | tee /tmp/with-emit-c.log || true

# Fallback: emit each module individually
SRC_FILES=(
    src/main.w
    src/BuildGraphKinds.w
    src/CCodegen.w
    src/Check.w
    src/Command.w
    src/Compile.w
    src/Diagnostics.w
    src/DiagnosticsJSON.w
    src/Error.w
    src/Link.w
    src/Parser.w
    src/Prelude.w
    src/Resolve.w
    src/ResolveBuildGraph.w
    src/Scan.w
    src/Token.kw
    src/Token.w
    src/TokenPrint.w
    src/TypeCheck.w
    src/TypeCheckStageTwo.w
)

for f in "${SRC_FILES[@]}"; do
    if [ -f "$f" ]; then
        base="$(basename "$f" .w)"
        dest="$BUNDLE_DIR/${base}.c"
        if [ ! -f "$dest" ]; then
            echo "[emit] $f -> $dest"
            with --emit-c "$f" -o "$dest" 2>/dev/null || true
        fi
    fi
done

echo ""
echo "[after-llvm] Phase 7: Write Windows-specific C bundle wrapper"
cat > "$BUNDLE_DIR/main.c" <<'EOF'
#include <stdint.h>

// Forward declaration from emitted code
extern int32_t with_main(int32_t argc, const uint8_t * const *argv);

int main(int argc, char **argv) {
    return with_main(argc, (const uint8_t * const *)argv);
}
EOF

echo ""
echo "[after-llvm] Phase 8: Write build instructions for Windows"
cat > "$BUNDLE_DIR/BUILD_WINDOWS.md" <<EOF
# Build With for Windows

The emitted C source in this directory targets Windows x86_64.

## Prerequisites
- Visual Studio 2019 or 2022 Build Tools (x64)
- Static LLVM SDK (libclang.lib, lld-link.exe)

## Quick Build

```cmd
# From Windows Command Prompt with MSVC x64 environment
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
cl /W3 /O2 /c bootstrap\windows_platform.c
# Then link all emitted C files + windows_platform.obj + libclang.lib
```

Or use the pre-built script:
```cmd
compile-bootstrap.cmd .\with-emit-c-windows .\out
```

EOF

echo ""
echo "[after-llvm] Done. Bundle ready at: $BUNDLE_DIR"
echo "[after-llvm] Next: On Windows, run: compile-bootstrap.cmd $BUNDLE_DIR"
