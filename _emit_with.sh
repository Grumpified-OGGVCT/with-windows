#!/usr/bin/env bash
set -e
cd /mnt/c/Users/gerry/generic_workspace/with-windows
OUT="/mnt/c/Users/gerry/generic_workspace/with-windows/with_emitted.c"
echo "Emitting src/main.w -> with_emitted.c ..."
./out/bin/with-stage2 build --emit-c src/main.w -o "$OUT" 2>&1
echo "Exit: $?"
ls -lh "$OUT" 2>/dev/null
