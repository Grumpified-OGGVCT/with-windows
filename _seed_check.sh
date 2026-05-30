#!/usr/bin/env bash
cd /mnt/c/Users/gerry/generic_workspace/with-windows
W="/mnt/c/Users/gerry/generic_workspace/with-windows/src/main"
chmod +x "$W" 2>/dev/null
echo "Seed: $("$W" --version | head -n1)"
echo "---"
echo "Check src/main.w..."
"$W" check src/main.w 2>&1 | tail -n5
echo "---"
echo "Check rt/rt_core.w..."
"$W" check rt/rt_core.w 2>&1 | tail -n5
echo "Done."
