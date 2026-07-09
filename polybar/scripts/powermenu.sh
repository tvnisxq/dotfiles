#!/bin/bash


chosen=$(printf "Lock\nLogout\nSuspend\nReboot\nShutdown" | rofi -dmenu -i -p "Power" -theme ~/.config/rofi/themes/glass.rasi)
case "$chosen" in
    Lock)
        cinnamon-screensaver-command -l
        ;;
    Logout)
        cinnamon-session-quit --logout
        ;;
    Suspend)
        systemctl suspend
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
esac
