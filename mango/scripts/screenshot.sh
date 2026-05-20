#!/bin/bash
wayfreeze --after-freeze-cmd 'grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; killall wayfreeze'
