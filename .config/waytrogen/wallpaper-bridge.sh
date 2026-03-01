#!/usr/bin/env bash

# Waytrogen passes the wallpaper path as the second argument
WALLPAPER_PATH="$2"

# Ensure the wallpaper path is valid before proceeding
if [ -z "$WALLPAPER_PATH" ]; then
    exit 1
fi

# Detect if we are in Wayland (Niri) or X11 (LeftWM)
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # We are in Niri. Use swww.
    
    # Ensure swww daemon is running
    swww query || swww init
    
    # Set the wallpaper with a nice transition
    swww img "$WALLPAPER_PATH" --transition-type wipe --transition-angle 30
    
else
    # We are in LeftWM. Use xwallpaper.
    xwallpaper --zoom "$WALLPAPER_PATH"
fi
