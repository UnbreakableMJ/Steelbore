{ config, pkgs, ... }:

let
  # Steelbore Color Theme: "Color is not decoration; it is telemetry."
  steelborePalette = {
    voidNavy    = "#000027"; # Background / Canvas
    moltenAmber = "#D98E32"; # Primary Text / Active Readout
    steelBlue   = "#4B7EB0"; # Primary Accent / Structural
    radiumGreen = "#50FA7B"; # Success / Safe Status
    redOxide    = "#FF5C5C"; # Warning / Error Status
    liquidCool  = "#8BE9FD"; # Info / Links
  };
in
{
  # Styling hints (for apps that support it)
  # This is a placeholder for more advanced themeing like home-manager or stylix
  environment.variables = {
    STEELBORE_BACKGROUND = steelborePalette.voidNavy;
    STEELBORE_TEXT       = steelborePalette.moltenAmber;
    STEELBORE_ACCENT     = steelborePalette.steelBlue;
    STEELBORE_SUCCESS    = steelborePalette.radiumGreen;
    STEELBORE_WARNING    = steelborePalette.redOxide;
    STEELBORE_INFO       = steelborePalette.liquidCool;
    
    LATTICE_THEME = "dark"; # Legacy compatibility or general hint
  };

  # TTY / Virtual Console Colors
  console = {
    # Reference: 0:Black, 1:Red, 2:Green, 3:Yellow, 4:Blue, 5:Magenta, 6:Cyan, 7:White
    # Brights are +8
    colors = [
      "000027" "FF5C5C" "50FA7B" "D98E32" "4B7EB0" "4B7EB0" "8BE9FD" "D98E32"
      "4B7EB0" "FF5C5C" "50FA7B" "D98E32" "8BE9FD" "8BE9FD" "8BE9FD" "D98E32"
    ];
    useXkbConfig = true;
  };
}
