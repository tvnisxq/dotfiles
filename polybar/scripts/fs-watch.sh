#!/usr/bin/env bash
# Hides polybar when the active window covers the full screen

pidof -x "$(basename "$0")" -o %PPID >/dev/null && exit 0

while sleep 0.5; do
    geom=$(xdotool getactivewindow getwindowgeometry --shell 2>/dev/null)
    screen=$(xrandr --query | grep ' connected primary' | grep -oP '\d+x\d+' | head -1)
    sw=${screen%x*}; sh=${screen#*x}
    w=$(echo "$geom" | grep '^WIDTH=' | cut -d= -f2)
    h=$(echo "$geom" | grep '^HEIGHT=' | cut -d= -f2)
    x=$(echo "$geom" | grep '^X=' | cut -d= -f2)
    y=$(echo "$geom" | grep '^Y=' | cut -d= -f2)

    if [ "$w" = "$sw" ] && [ "$h" = "$sh" ] && [ "$x" = "0" ] && [ "$y" = "0" ]; then
        polybar-msg cmd hide >/dev/null 2>&1
    else
        polybar-msg cmd show >/dev/null 2>&1
    fi
done
