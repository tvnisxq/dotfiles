#!/bin/bash
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
if [ $((vol % 5)) -eq 0 ]; then
    new=$((vol - 5))
else
    new=$(( (vol / 5) * 5 ))
fi
[ "$new" -lt 0 ] && new=0
pactl set-sink-volume @DEFAULT_SINK@ "${new}%"
