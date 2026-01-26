{ config, pkgs, ... }:

{
  imports = [
    ./categories.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    # Core essentials not included in categories
    git
    vim
    wget
    curl
  ];
}
