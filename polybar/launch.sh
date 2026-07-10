#!/bin/bash

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 0.2
done

pgrep -x nm-applet >/dev/null || nm-applet &

MONITOR=HDMI-0 polybar example &
