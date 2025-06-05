{
  description = "Cyrus' nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
    minimal-tmux
    }:
  let username = "cyrus"; in
  let homedir = "/Users/cyrus"; in
  let
    configuration = { pkgs, ... }: {
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # direnv enable
      programs.direnv.enable = true;
      programs.direnv.nix-direnv.enable = true;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.cyrus = {
        name = username;
        home = homedir;
      };
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit username homedir inputs; };
      modules = [ 
        configuration
        ./modules/configuration.nix
        ./modules/home-manager.nix
      ];
    };
  };
}
