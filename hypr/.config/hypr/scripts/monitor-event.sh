#!/bin/bash
# Restart waybar when monitors are connected or disconnected.
# Hyprland fires monitoradded/monitorremoved events on the socket2.

handle() {
    case $1 in
        monitoradded*|monitorremoved*)
            sleep 1
            killall waybar
            waybar &
            ;;
    esac
}

nc -U "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" \
    | while read -r line; do handle "$line"; done
