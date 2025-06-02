{
  config,
  pkgs,
  lib,
  username,
  homedir,
  inputs,
  ...
}:
let cyrusConfig = {
  pkgs,
  lib,
  config,
  inputs,
  username,
  homedir,
  ...
}: {
  home = {
    stateVersion = "23.05";

    username = username;
    homeDirectory = homedir;

    packages = with pkgs; [
      # Local apps
      # $ nix-env -qaP | grep wget
      # General GUI apps

      #anki-bin
      #discord
      prismlauncher 
      zathura
      #obsidian
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    file = {
      ".zshrc".source = ../configs/zshrc;
    };
  };

  programs = {
    htop = {
        enable = true;
        settings.show_program_path = true;
    };
    git = {
      enable = true;
      userName = "${username}";
      ignores = [".DS_STORE"];
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };
    tmux = {
      enable = true;
      extraConfig = builtins.readFile ../configs/tmux.conf;
    };
  };

  programs.home-manager.enable = true;
};
in
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit username homedir inputs; };

    useGlobalPkgs = true;
    useUserPackages = true;
    # verbose = true;
    users.cyrus = cyrusConfig;
  };
}
