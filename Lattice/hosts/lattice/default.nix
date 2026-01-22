{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Assuming generic or to be generated
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lattice";

  # Set your time zone.
  time.timeZone = "UTC";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account.
  users.users.mj = {
    isNormalUser = true;
    description = "Steelbore User";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.nushell;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
