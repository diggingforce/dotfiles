#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/Videos/Recordings"
mkdir -p "$DIR"

if pgrep -f "gpu-screen-recorder" >/dev/null; then
    pkill -SIGINT -f "gpu-screen-recorder"
    notify-send "Recording Saved" "Video saved to ~/Videos/Recordings"
else
    FILE="$DIR/recording_$(date +'%Y-%m-%d_%H-%M-%S').mp4"
    gpu-screen-recorder -w screen -f 60 -a default_output -c mp4 -k h264 -q ultra -o "$FILE" >/dev/null 2>&1 &
    sleep 0.3
    if pgrep -f "gpu-screen-recorder" >/dev/null; then
        notify-send "Recording Started" "Press hotkey again to stop and save"
    else
        notify-send "Recording Error" "Failed to start GPU Screen Recorder" -u critical
    fi
fi
