{ config, pkgs, ... }:

let
  gui-script = pkgs.writeShellScriptBin "gui" ''
    echo "Lattice GUI Selector"
    echo "1) COSMIC (Wayland)"
    echo "2) Niri (Wayland)"
    echo "3) LeftWM (X11)"
    read -p "Select environment: " choice

    case $choice in
      1) exec start-cosmic ;;
      2) exec niri ;;
      3) exec startx /usr/bin/env leftwm ;;
      *) echo "Invalid choice";;
    esac
  '';
in
{
  imports = [
    ./leftwm.nix
    ./niri.nix
    ./cosmic.nix
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd nu";
        user = "mj";
      };
    };
  };


  environment.systemPackages = [
    gui-script
  ];

  # Unlock the TTY for the gui command if needed
  security.polkit.enable = true;
}
