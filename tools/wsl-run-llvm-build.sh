#!/usr/bin/env bash
export PATH="/home/grumpified/.local/bin:$PATH"
cd /mnt/c/Users/gerry/generic_workspace/with-windows
tools/build-static-llvm.sh 2>&1 | tee /tmp/llvm-build.log
