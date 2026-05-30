#!/usr/bin/env bash
set -e
cd /mnt/c/Users/gerry/generic_workspace/with-windows
make build WITH=/mnt/c/Users/gerry/generic_workspace/with-windows/src/main 2>&1
rc=$?
echo "BUILD_EXIT_CODE=$rc"
if [ -f out/bin/with-stage2 ]; then
  echo "STAGE2_OK: $(stat -c%s out/bin/with-stage2) bytes"
  out/bin/with-stage2 --version | head -n1
fi
