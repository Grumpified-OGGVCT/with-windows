#!/usr/bin/env bash
set -e
cd /mnt/c/Users/gerry/generic_workspace/with-windows
W=./out/bin/with-stage2
for f in llvm_bridge clang_bridge cimport_stubs; do
  echo "=== $f.w ==="
  "$W" build --emit-c "rt/$f.w" -o "/mnt/c/Users/gerry/generic_workspace/with-windows/${f}_emitted.c" 2>&1 | tail -n2
  if [ -f "/mnt/c/Users/gerry/generic_workspace/with-windows/${f}_emitted.c" ]; then
    echo "  OK: $(wc -c < /mnt/c/Users/gerry/generic_workspace/with-windows/${f}_emitted.c) bytes"
  fi
done
echo "Done."
