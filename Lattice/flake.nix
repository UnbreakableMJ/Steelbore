{
  description = "Lattice NixOS Configuration - The memory-safe, Rust-native ecosystem.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11"; # Latest stable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nixos-cosmic, ... }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.lattice = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit unstable; };
      modules = [
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:D7qyURoe9XfAnK7KSeY8/0iO21mnd0QId49zCHvZa6o=" ];
          };
        }
        nixos-cosmic.nixosModules.default
        ./hosts/lattice
        ./modules/packages
        ./modules/gui
        ./modules/core/theme.nix
      ];
    };
  };
}
