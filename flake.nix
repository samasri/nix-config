{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Manages configs links things into your home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    let
      darwinModule = import ./module/darwin/default.nix;
      darwinConfig = darwinModule {
        inherit nixpkgs self;
      };
    in
    {
      darwinConfigurations."1ae94743-4ad9-4e00-a144-f6dfb4bab4dc" = nix-darwin.lib.darwinSystem {
        modules = [
          darwinConfig
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.m1.imports = [ ./module/home-manager ];
            };
          }
        ];
      };
      darwinPackages = self.darwinConfigurations."1ae94743-4ad9-4e00-a144-f6dfb4bab4dc".pkgs;
    };
}

# Call with: darwin-rebuild switch -v --flake ~/.config/nix-darwin
