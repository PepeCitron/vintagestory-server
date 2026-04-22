#!/bin/sh
if [ -z "$1" ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

su vintagestory -s /bin/sh -c "screen -S vsserver -X stuff \"$(printf '%s' "$1")\n\""