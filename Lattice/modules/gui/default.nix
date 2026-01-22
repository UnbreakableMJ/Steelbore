{ config, pkgs, ... }:

let
  gui-script = pkgs.writeShellScriptBin "gui" ''
    echo "Lattice GUI Selector"
    echo "1) LeftWM (X11)"
    echo "2) Niri (Wayland)"
    echo "3) COSMIC (Wayland)"
    read -p "Select environment: " choice

    case $choice in
      1) exec dwm ;; # Placeholder for LeftWM start command
      2) exec niri ;;
      3) exec start-cosmic ;;
      *) echo "Invalid choice";;
    esac
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd nu";
        user = "mj";
      };
    };
  };

  # Graphical session support
  services.xserver.windowManager.leftwm.enable = true;
  programs.niri.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = false; # We use tuigreet for the TTY flow

  environment.systemPackages = [
    gui-script
  ];

  # Unlock the TTY for the gui command if needed
  security.polkit.enable = true;
}
