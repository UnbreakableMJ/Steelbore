{
  description: "Steelbore NixOS Configuration - The memory-safe, Rust-native ecosystem.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11"; # Latest stable
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixos-cosmic, ... }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.steelbore = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:D7qyURoe9XfAnK7KSeY8/0iO21mnd0QId49zCHvZa6o=" ];
          };
        }
        nixos-cosmic.nixosModules.default
        ./hosts/steelbore
        ./modules/packages
        ./modules/gui
        ./modules/core/theme.nix
      ];
    };
  };
}
