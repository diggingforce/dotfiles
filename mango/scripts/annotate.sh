#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FILE="$DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
TMP="/tmp/satty_temp_$$.png"

trap 'rm -f "$TMP"' EXIT

if command -v wayfreeze &>/dev/null; then
    wayfreeze --after-freeze-cmd "grim -g \"\$(slurp)\" \"$TMP\"; killall wayfreeze" 2>/dev/null || true
else
    grim -g "$(slurp)" "$TMP" 2>/dev/null || true
fi

if [ -s "$TMP" ]; then
    satty --filename "$TMP" --fullscreen --output-filename "$FILE" --early-exit
fi
