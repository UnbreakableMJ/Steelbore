{ config, pkgs, ... }:

{
  services.xserver.windowManager.leftwm.enable = true;

  environment.systemPackages = with pkgs; [
    leftwm
  ];
}
