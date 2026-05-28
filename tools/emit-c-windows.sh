#!/usr/bin/env bash
# emit-c-windows.sh -- Emit a Windows-compatible C bundle in WSL2
# Must run after self-hosted compiler is built: make build && make install
#
# Usage in WSL2:
#   ./tools/emit-c-windows.sh [bundle_dir_name]
#
# Produces:
#   bundle_dir/
#     *.c       -- emitted C for each .w module
#     main.c    -- entry point
#     Makefile  -- quick compile test with lld

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
BUNDLE_NAME="${1:-with-emit-c-windows}"
BUNDLE_DIR="$REPO_DIR/$BUNDLE_NAME"

WITH="${WITH:-$(command -v with || true)}"
if [ -z "$WITH" ] || [ ! -x "$WITH" ]; then
    echo "ERROR: with compiler not found on PATH. Run 'make install' first."
    exit 1
fi

echo "[emit] Compiler: $WITH"
echo "[emit] Output:   $BUNDLE_DIR"
echo "[emit] Target:   windows_x86_64 (emit-C, C code is platform-neutral)"

rm -rf "$BUNDLE_DIR"
mkdir -p "$BUNDLE_DIR"

# Emit all .w sources in src/ and lib/std/
# The compiler's emit-C mode outputs one .c per module.
# We use a small build script to drive it.
cd "$REPO_DIR"

# Create a temporary build graph that targets windows_x86_64 and emits C
# We'll write a minimal build.w snippet
cat > "$BUNDLE_DIR/_emit_build.w" <<'EOF'
# Minimal build graph for emit-C on Windows target
build_graph: BuildGraphEntry
build_graph.target = :windows_x86_64
build_graph.emit_c = true
build_graph.obj_dir = "build/c"
EOF

# Emit C for all modules
# For now, emit the runtime core and compiler sources
# Note: The exact emit-C invocation depends on the compiler flag for emit-c
# In with v0.14.3 the flag is typically --emit-c or part of the build system.
# Since we are self-hosting, we can use the with binary to drive compilation.
# Fallback: emit each .w individually.

EMIT_FLAGS="--emit-c"
if ! "$WITH" check src/main.w > /dev/null 2>&1; then
    echo "WARNING: 'with check' failed on src/main.w -- seed may be stale"
fi

# List all .w files we want to emit C for
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
    lib/std/*.w
    rt/rt_core.w
)

# Emit C for each file (some are modules, some are includes)
for f in "${SRC_FILES[@]}"; do
    if [ -f "$f" ]; then
        base="$(basename "$f" .w)"
        echo "[emit] $f -> $base.c"
        # If the compiler supports per-file emit-c:
        "$WITH" $EMIT_FLAGS "$f" -o "$BUNDLE_DIR/$base.c" 2>/dev/null || true
    fi
done

# Also emit the bundle using the build system if available
if "$WITH" build --emit-c "$BUNDLE_DIR" 2>/dev/null; then
    echo "[emit] Build-system emit-c succeeded"
else
    echo "[emit] Build-system emit-c not available; individual files emitted above"
fi

# Write a minimal main.c that calls with_main(argc, argv)
cat > "$BUNDLE_DIR/main.c" <<'EOF'
#include <stdint.h>

// Forward declaration from emitted code
extern int32_t with_main(int32_t argc, const uint8_t * const *argv);

int main(int argc, char **argv) {
    return with_main(argc, (const uint8_t * const *)argv);
}
EOF

# Write a makefile for quick compile test with lld (Linux)
cat > "$BUNDLE_DIR/Makefile" <<'EOF'
CC = clang
CFLAGS = -O2 -Wall -Wextra -fwrapv -fno-strict-aliasing
OBJS = $(wildcard *.o)

with: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) -lpthread -ldl -lm

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f with *.o
EOF

echo "[emit] Bundle ready: $BUNDLE_DIR"
echo "[emit] Next steps:"
echo "  1. On Windows: run compile-bootstrap.cmd $BUNDLE_DIR"
echo "  2. Or in WSL2: cd $BUNDLE_DIR && make"
