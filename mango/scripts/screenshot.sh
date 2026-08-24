#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
FILE_NAME="screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
ICON="$HOME/.config/mango/scripts/screenshot.png"

wayfreeze --after-freeze-cmd "grim -g \"\$(slurp)\" \"$FILE\" && wl-copy < \"$FILE\"; killall wayfreeze" &
sleep 0.2
notify-send "Screenshot Captured" "Saved as $FILE_NAME" -i "$ICON"
