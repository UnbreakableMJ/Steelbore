{ config, pkgs, ... }:

let
  # Steelbore Colors
  steelborePalette = {
    charcoalNavy = "#0E141D";
    midnightBlue = "#142E46";
    vibrantOrange = "#FE6B00";
  };
in
{
  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Styling hints (for apps that support it)
  # This is a placeholder for more advanced themeing like home-manager or stylix
  environment.variables = {
    STEELBORE_THEME = "dark";
    STEELBORE_ORANGE = steelborePalette.vibrantOrange;
  };
}
