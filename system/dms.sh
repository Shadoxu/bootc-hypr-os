#!/bin/sh

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland

if [ -f "$HOME/.config/hypr/hyprland.conf" ]; then
    exec Hyprland
else
    exec Hyprland
fi
