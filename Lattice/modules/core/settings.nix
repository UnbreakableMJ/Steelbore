{ config, pkgs, ... }:

{
  # Shell & Prompt
  programs.nushell = {
    enable = true;
    configFile.text = ''
      $env.config = {
        show_banner: false,
        ls: {
          use_ls_colors: true,
          clickable_links: true,
        },
        cursor_shape: {
          emacs: block,
          vi_insert: block,
          vi_normal: block,
        },
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
  
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$git_branch$git_status$cmd_duration$character";
      
      palette = "steelbore";
      palettes.steelbore = {
        void_navy = "#000027";
        molten_amber = "#D98E32";
        steel_blue = "#4B7EB0";
        radium_green = "#50FA7B";
        red_oxide = "#FF5C5C";
        liquid_coolant = "#8BE9FD";
      };

      directory = {
        style = "bold steel_blue";
        truncate_to_repo = true;
      };

      character = {
        success_symbol = "[➜](bold radium_green)";
        error_symbol = "[✗](bold red_oxide)";
      };

      git_branch = {
        style = "bold liquid_coolant";
        symbol = " ";
      };

      git_status = {
        style = "bold red_oxide";
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
      };
    };
  };

  # System-wide Terminal Configuration (Alacritty)
  environment.etc."alacritty/alacritty.toml".text = ''
    [window]
    padding = { x = 10, y = 10 }
    dynamic_title = true
    opacity = 0.95

    [font]
    normal = { family = "Cascadia Code", style = "Regular" }
    bold = { family = "Cascadia Code", style = "Bold" }
    italic = { family = "Cascadia Code", style = "Italic" }
    size = 12.0

    [colors.primary]
    background = "#000027"
    foreground = "#D98E32"

    [colors.cursor]
    text = "#000027"
    cursor = "#D98E32"

    [colors.selection]
    text = "#000027"
    background = "#4B7EB0"

    [colors.normal]
    black = "#000027"
    red = "#FF5C5C"
    green = "#50FA7B"
    yellow = "#D98E32"
    blue = "#4B7EB0"
    magenta = "#4B7EB0"
    cyan = "#8BE9FD"
    white = "#D98E32"

    [colors.bright]
    black = "#4B7EB0"
    red = "#FF5C5C"
    green = "#50FA7B"
    yellow = "#D98E32"
    blue = "#8BE9FD"
    magenta = "#8BE9FD"
    cyan = "#8BE9FD"
    white = "#D98E32"
  '';

  # WezTerm Configuration
  environment.etc."wezterm/wezterm.lua".text = ''
    local wezterm = require 'wezterm'
    return {
      font = wezterm.font 'Cascadia Code',
      font_size = 12.0,
      window_background_opacity = 0.95,
      colors = {
        foreground = "#D98E32",
        background = "#000027",
        cursor_bg = "#D98E32",
        cursor_fg = "#000027",
        selection_bg = "#4B7EB0",
        selection_fg = "#000027",
        ansi = {
          "#000027", "#FF5C5C", "#50FA7B", "#D98E32", "#4B7EB0", "#4B7EB0", "#8BE9FD", "#D98E32"
        },
        brights = {
          "#4B7EB0", "#FF5C5C", "#50FA7B", "#D98E32", "#8BE9FD", "#8BE9FD", "#8BE9FD", "#D98E32"
        },
      }
    }
  '';

  # Rio Configuration
  environment.etc."rio/config.toml".text = ''
    style = { font = "Cascadia Code", size = 18 }
    [colors]
    background = '#000027'
    foreground = '#D98E32'
    cursor = '#D98E32'
    selection-background = '#4B7EB0'
    selection-foreground = '#000027'
    [colors.regular]
    black = '#000027'
    red = '#FF5C5C'
    green = '#50FA7B'
    yellow = '#D98E32'
    blue = '#4B7EB0'
    magenta = '#4B7EB0'
    cyan = '#8BE9FD'
    white = '#D98E32'
  '';

  # Steelbore System Bar (Ironbar)
  environment.etc."ironbar/config.yaml".text = ''
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

  environment.etc."ironbar/style.css".text = ''
    * {
        font-family: "Share Tech Mono", monospace;
        font-size: 14px;
        transition: none;
    }

    window {
        background-color: #000027;
        color: #D98E32;
        border-bottom: 2px solid #4B7EB0;
    }

    .widget {
        padding: 0 10px;
        border-left: 1px solid #4B7EB0;
    }

    .workspaces button {
        color: #4B7EB0;
        border-bottom: 2px solid transparent;
    }

    .workspaces button.active {
        color: #D98E32;
        border-bottom: 2px solid #D98E32;
    }

    .workspaces button:hover {
        background-color: #4B7EB0;
        color: #000027;
    }

    .clock {
        color: #D98E32;
        font-weight: bold;
    }

    .sys_info {
        color: #50FA7B; /* Radium Green for status */
    }
  '';

  # Git defaults
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      core.editor = "hx";
      color.ui = true;
    };
  };

  # Services
  services.flatpak.enable = true;

  # Security
  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };
}
