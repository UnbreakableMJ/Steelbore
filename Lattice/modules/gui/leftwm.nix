{ config, pkgs, unstable, ... }:

{
  services.xserver.windowManager.leftwm.enable = true;

  environment.systemPackages = with pkgs; [
    leftwm
    unstable.rlaunch
  ];
}
