{
  description = "Cyrus' Nix system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
    };
  };

  outputs = inputs@{ 
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    ...
  }:
  let
    username = "cyrus";
    darwinHomedir = "/Users/cyrus";
    linuxHomedir = "/home/cyrus";
  in
  {
    # darwin specific conf
    darwinConfigurations."cyrus" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit self username darwinHomedir linuxHomedir inputs; };

      modules = [ 
        ./modules/darwin-system.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.cyrus = {
            _module.args = {
              inherit username inputs;
              homedir = darwinHomedir;
            };
          
            imports = [
              ./modules/home.nix
            ];
          };
        }
      ];
    };

    # linux conf
    homeConfigurations."cyrus" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      extraSpecialArgs = {
        inherit self username inputs;
        homedir = linuxHomedir;
      };

      modules = [
        ./modules/home.nix
      ];
      
    };
  };
}
