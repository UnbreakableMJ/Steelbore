{ config, pkgs, ... }:

{
  imports = [
    ./categories.nix
  ];

  environment.systemPackages = with pkgs; [
    # Core essentials not included in categories
    git
    vim
    wget
    curl
  ];
}
