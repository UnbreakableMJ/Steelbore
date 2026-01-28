{ config, pkgs, ... }:

let
  steelborePalette = {
    voidNavy    = "#000027";
    moltenAmber = "#D98E32";
    steelBlue   = "#4B7EB0";
    radiumGreen = "#50FA7B";
    redOxide    = "#FF5C5C";
    liquidCool  = "#8BE9FD";
  };
in
{
  # Home Manager Status
  home.username = "mj";
  home.homeDirectory = "/home/mj";
  home.stateVersion = "25.11";

  # Global Input Configuration (Keyboard)
  home.keyboard = {
    layout = "us,ar";
    options = [ "grp:ctrl_space_toggle" ];
    # Additional X11/Wayland mapping handled by system or window manager config
  };

  # Direct Program Configuration (Steelbore Style)
  programs = {
    # Git identity
    git = {
      enable = true;
      userName = "UnbreakableMJ";
      userEmail = "34196588+UnbreakableMJ@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        gpg.format = "ssh";
      };
    };

    # Shell Integrations
    starship = {
      enable = true;
      settings = {
        format = "$directory$git_branch$git_status$cmd_duration$character";
        palette = "steelbore";
        palettes.steelbore = {
          void_navy = "${steelborePalette.voidNavy}";
          molten_amber = "${steelborePalette.moltenAmber}";
          steel_blue = "${steelborePalette.steelBlue}";
          radium_green = "${steelborePalette.radiumGreen}";
          red_oxide = "${steelborePalette.redOxide}";
          liquid_coolant = "${steelborePalette.liquidCool}";
        };
        directory = { style = "bold steel_blue"; truncate_to_repo = true; };
        character = {
          success_symbol = "[➜](bold radium_green)";
          error_symbol = "[✗](bold red_oxide)";
        };
        git_branch = { style = "bold liquid_coolant"; symbol = " "; };
        git_status = { style = "bold red_oxide"; format = "([\\[$all_status$ahead_behind\\]]($style) )"; };
      };
    };

    nushell = {
      enable = true;
      configFile.text = ''
        $env.config = {
          show_banner: false,
          ls: { use_ls_colors: true, clickable_links: true },
          cursor_shape: { emacs: block, vi_insert: block, vi_normal: block },
        }

        # Steelbore Telemetry Aliases
        alias ll = ls -l
        alias lla = ls -la
        alias telemetry = macchina
        alias sensors = watch -n 1 sensors
        alias sys-logs = journalctl -p 3 -xb
        alias network-diag = gping google.com
        alias top-processes = bottom
        alias disk-telemetry = yazi
        alias edit = hx
        
        # Project Steelbore Identity
        def steelbore [] {
          print "STEELBORE :: Industrial Sci-Fi Utility Environment"
          print "STATUS    :: ACTIVE"
          print "LOAD      :: NOMINAL"
        }
      '';
    };

    alacritty = {
      enable = true;
      settings = {
        window = { padding = { x = 10; y = 10 }; dynamic_title = true; opacity = 0.95; };
        font = { normal = { family = "Cascadia Code"; style = "Regular"; }; size = 12.0; };
        colors = {
          primary = { background = "${steelborePalette.voidNavy}"; foreground = "${steelborePalette.moltenAmber}"; };
          cursor = { text = "${steelborePalette.voidNavy}"; cursor = "${steelborePalette.moltenAmber}"; };
          selection = { text = "${steelborePalette.voidNavy}"; background = "${steelborePalette.steelBlue}"; };
          normal = {
            black = "${steelborePalette.voidNavy}"; red = "${steelborePalette.redOxide}";
            green = "${steelborePalette.radiumGreen}"; yellow = "${steelborePalette.moltenAmber}";
            blue = "${steelborePalette.steelBlue}"; magenta = "${steelborePalette.steelBlue}";
            cyan = "${steelborePalette.liquidCool}"; white = "${steelborePalette.moltenAmber}";
          };
          bright = {
            black = "${steelborePalette.steelBlue}"; red = "${steelborePalette.redOxide}";
            green = "${steelborePalette.radiumGreen}"; yellow = "${steelborePalette.moltenAmber}";
            blue = "${steelborePalette.liquidCool}"; magenta = "${steelborePalette.liquidCool}";
            cyan = "${steelborePalette.liquidCool}"; white = "${steelborePalette.moltenAmber}";
          };
        };
      };
    };
  };
  
  # Session Variables (Steelbore Identity)
  home.sessionVariables = {
    EDITOR = "hx";
    STEELBORE_THEME = "true";
  };

  # XDG Config Files (Ported from system settings)
  xdg.configFile = {
    "niri/config.kdl".text = ''
      layout {
          focus-ring {
              enable
              width 2
              active-color "${steelborePalette.moltenAmber}"
              inactive-color "${steelborePalette.steelBlue}"
          }
          border {
              off
              width 1
              active-color "${steelborePalette.moltenAmber}"
              inactive-color "${steelborePalette.steelBlue}"
          }
          gaps 8
      }

      spawn-at-startup "swaybg" "-c" "${steelborePalette.voidNavy}"
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

    "ironbar/config.yaml".text = ''
      anchor_to_edges: true
      position: top
      start:
        - type: workspaces
        - type: focused
      center:
        - type: clock
          format: "%H:%M:%S :: %Y-%m-%d"
      end:
        - type: sys_info
          interval: 1
          format: "CPU: {cpu_percent}% | RAM: {memory_percent}%"
        - type: tray
    '';

    "ironbar/style.css".text = ''
      * { font-family: "Share Tech Mono", monospace; font-size: 14px; transition: none; }
      window { background-color: ${steelborePalette.voidNavy}; color: ${steelborePalette.moltenAmber}; border-bottom: 2px solid ${steelborePalette.steelBlue}; }
      .widget { padding: 0 10px; border-left: 1px solid ${steelborePalette.steelBlue}; }
      .workspaces button { color: ${steelborePalette.steelBlue}; border-bottom: 2px solid transparent; }
      .workspaces button.active { color: ${steelborePalette.moltenAmber}; border-bottom: 2px solid ${steelborePalette.moltenAmber}; }
      .workspaces button:hover { background-color: ${steelborePalette.steelBlue}; color: ${steelborePalette.voidNavy}; }
      .clock { color: ${steelborePalette.moltenAmber}; font-weight: bold; }
      .sys_info { color: ${steelborePalette.radiumGreen}; }
    '';

    "wezterm/wezterm.lua".text = ''
      local wezterm = require 'wezterm'
      return {
        font = wezterm.font 'Cascadia Code',
        font_size = 12.0,
        window_background_opacity = 0.95,
        colors = {
          foreground = "${steelborePalette.moltenAmber}",
          background = "${steelborePalette.voidNavy}",
          cursor_bg = "${steelborePalette.moltenAmber}",
          cursor_fg = "${steelborePalette.voidNavy}",
          selection_bg = "${steelborePalette.steelBlue}",
          selection_fg = "${steelborePalette.voidNavy}",
          ansi = { "${steelborePalette.voidNavy}", "${steelborePalette.redOxide}", "${steelborePalette.radiumGreen}", "${steelborePalette.moltenAmber}", "${steelborePalette.steelBlue}", "${steelborePalette.steelBlue}", "${steelborePalette.liquidCool}", "${steelborePalette.moltenAmber}" },
          brights = { "${steelborePalette.steelBlue}", "${steelborePalette.redOxide}", "${steelborePalette.radiumGreen}", "${steelborePalette.moltenAmber}", "${steelborePalette.liquidCool}", "${steelborePalette.liquidCool}", "${steelborePalette.liquidCool}", "${steelborePalette.moltenAmber}" },
        }
      }
    '';
    
    "rio/config.toml".text = ''
      style = { font = "Cascadia Code", size = 18 }
      [colors]
      background = '${steelborePalette.voidNavy}'
      foreground = '${steelborePalette.moltenAmber}'
      cursor = '${steelborePalette.moltenAmber}'
      selection-background = '${steelborePalette.steelBlue}'
      selection-foreground = '${steelborePalette.voidNavy}'
      [colors.regular]
      black = '${steelborePalette.voidNavy}'
      red = '${steelborePalette.redOxide}'
      green = '${steelborePalette.radiumGreen}'
      yellow = '${steelborePalette.moltenAmber}'
      blue = '${steelborePalette.steelBlue}'
      magenta = '${steelborePalette.steelBlue}'
      cyan = '${steelborePalette.liquidCool}'
      white = '${steelborePalette.moltenAmber}'
    '';
  };
}
