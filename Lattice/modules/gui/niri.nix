{ config, pkgs, unstable, ... }:

{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    niri
    swaybg
    xwayland-satellite # For X11 app support if needed
    waybar
    ironbar
    unstable.anyrun
  ];

  # System-wide Niri configuration hint
  environment.etc."niri/config.kdl".text = ''
    layout {
        focus-ring {
            enable
            width 2
            active-color "#D98E32"   // Molten Amber
            inactive-color "#4B7EB0" // Steel Blue
        }
        border {
            off
            width 1
            active-color "#D98E32"
            inactive-color "#4B7EB0"
        }
        gaps 8
    }

    spawn-at-startup "swaybg" "-c" "#000027"
    spawn-at-startup "ironbar"

    binds {
        Mod+Shift+E { quit; }
        Mod+Return { spawn "alacritty"; }
        Mod+D { spawn "onagre"; }
        
        // Window Management
        Mod+Q { close-window; }
        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Up    { focus-window-up; }
        Mod+Down  { focus-window-down; }
    }
  '';
}
