{ config, pkgs, ... }:

let
  # Lattice Colors
  latticePalette = {
    charcoalNavy = "#0E141D";
    midnightBlue = "#142E46";
    vibrantOrange = "#FE6B00";
  };
in
{
  # Fonts
  fonts.packages = with pkgs; [
    # NixOS standard packages
    orbitron
    jetbrains-mono
    cascadia-code
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # Custom / Missing fonts
    (fetchzip {
      url = "https://font.download/dl/font/future-earth.zip";
      hash = "sha256-025plp4kn6xria0j1k8sky729kk9p41d6j8rczzsdvj1a18jf2yz";
      stripRoot = false;
    })

    (stdenv.mkDerivation {
      pname = "share-tech-mono";
      version = "1.0";
      src = fetchurl {
        url = "https://github.com/google/fonts/raw/main/ofl/sharetechmono/ShareTechMono-Regular.ttf";
        hash = "sha256-0xr6ffvbx8516rxb5h2767fzfgp079bkgxf0b7r9m0hlfkwb3slw";
      };
      dontUnpack = true;
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp $src $out/share/fonts/truetype/ShareTechMono-Regular.ttf
      '';
    })
  ];

  # Styling hints (for apps that support it)
  # This is a placeholder for more advanced themeing like home-manager or stylix
  environment.variables = {
    LATTICE_THEME = "dark";
    LATTICE_ORANGE = latticePalette.vibrantOrange;
  };
}
