{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # UI Headers
    orbitron
    # Editor / Code
    jetbrains-mono
    # Terminal / CLI
    cascadia-code
    # Nerd Fonts (JetBrains Mono)
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # BRAND / HERO: Future Earth
    (fetchzip {
      url = "https://font.download/dl/font/future-earth.zip";
      # Hash verified from existing theme.nix
      hash = "sha256-025plp4kn6xria0j1k8sky729kk9p41d6j8rczzsdvj1a18jf2yz";
      stripRoot = false;
    })

    # HUD / Data: Share Tech Mono
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

  # Default font configuration hints
  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrains Mono" "Share Tech Mono" "Cascadia Code" ];
      sansSerif = [ "Orbitron" ];
      serif = [ "Orbitron" ];
    };
  };
}
