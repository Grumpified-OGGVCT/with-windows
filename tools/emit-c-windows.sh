#!/usr/bin/env bash
# emit-c-windows.sh -- Emit a Windows-compatible C bundle in WSL2
# Usage: ./tools/emit-c-windows.sh [bundle_dir_name]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
BUNDLE_NAME="${1:-with-emit-c-windows}"
BUNDLE_DIR="$REPO_DIR/$BUNDLE_NAME"

WITH="${WITH:-$(command -v with || true)}"
if [ -z "$WITH" ] || [ ! -x "$WITH" ]; then
    # Fallback: use stage2 from out/bin
    WITH="$REPO_DIR/out/bin/with-stage2"
    if [ ! -x "$WITH" ]; then
        echo "ERROR: with compiler not found. Run 'make build' first."
        exit 1
    fi
fi

echo "[emit] Compiler: $WITH"
"$WITH" --version

cd "$REPO_DIR"

rm -rf "$BUNDLE_DIR"
mkdir -p "$BUNDLE_DIR"

echo "[emit] Building with --emit-c to $BUNDLE_DIR"
# The correct invocation is: with build --emit-c <source> -o <output>
# Per DriverOptions.w line 273: --emit-c sets output_kind = BuildOutputKind.C
# Per main.w line 1334-1339: it calls comp.emit_c(source_path, output_path)
"$WITH" build --emit-c "$BUNDLE_DIR/src" -o "$BUNDLE_DIR" 2>&1 || {
    echo "--"
    echo "[emit] Fallback: emitting with src/main.w directly"
    "$WITH" build --emit-c src/main.w -o "$BUNDLE_DIR" 2>&1 || true
}

echo "---"
echo "[emit] Listing emitted files:"
find "$BUNDLE_DIR" -type f -ls 2>/dev/null || ls -lh "$BUNDLE_DIR/"

echo "[emit] Done. Bundle at: $BUNDLE_DIR"
