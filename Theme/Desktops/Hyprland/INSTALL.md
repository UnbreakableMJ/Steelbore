# Installing Steelbore Theme for Hyprland

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

## Installation

1. Merge the contents of `hyprland.conf` into your Hyprland config:
   - `~/.config/hypr/hyprland.conf`
2. Copy `Steelbore_wallpaper_blue.png` to `~/Pictures/`.
3. Update the wallpaper path in `hyprland.conf`:
   ```ini
   exec = hyprpaper
   ```
   And set your `hyprpaper.conf`:
   ```ini
   preload = ~/Pictures/Steelbore_wallpaper_blue.png
   wallpaper = ,~/Pictures/Steelbore_wallpaper_blue.png
   ```
4. Reload Hyprland (`Mod+Shift+E` or re-login).
