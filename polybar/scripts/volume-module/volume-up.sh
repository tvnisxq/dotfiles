#!/bin/bash
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
new=$(( (vol / 5 + 1) * 5 ))
[ "$new" -gt 150 ] && new=150
pactl set-sink-volume @DEFAULT_SINK@ "${new}%"
