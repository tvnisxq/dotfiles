#!/bin/bash
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)

if [ "$mute" = "yes" ]; then
    echo "󰖁 Mute"
else
    echo "󰕾 ${vol}%"
fi
