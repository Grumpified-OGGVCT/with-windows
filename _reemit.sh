#!/usr/bin/env bash
set -e
cd /mnt/c/Users/gerry/generic_workspace/with-windows
WITH=./out/bin/with-stage2
OUT=/mnt/c/Users/gerry/generic_workspace/with-windows

echo "Stage2: $("$WITH" --version | head -n1)"
echo ""

for f in rt_core panic_runtime regex_runtime compat_runtime fiber_stubs fiber_runtime channel_runtime; do
  echo "=== $f.w ==="
  "$WITH" build --emit-c "rt/$f.w" -o "$OUT/${f}_emitted.c" 2>&1 | tail -n3
  if [ -f "$OUT/${f}_emitted.c" ]; then
    sz=$(wc -c < "$OUT/${f}_emitted.c")
    echo "   $sz bytes"
  else
    echo "   FAILED"
  fi
done
echo ""
echo "All emitted."
