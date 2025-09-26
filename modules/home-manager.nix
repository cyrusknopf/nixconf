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
      helix
      #obsidian
      
      marksman      # markdown LSP
      codebook      # spellcheck LSP


      (python313.withPackages (ps: with ps; [
        requests
        python-lsp-server
      ]))
    ];

    sessionVariables = {
      EDITOR = "hx";
    };

    file = {
      ".zshrc".source = ../configs/zshrc;
      ".clangd".source = ../configs/.clangd;

      ".config/helix/config.toml".source = ../configs/helix/config.toml;
      ".config/helix/languages.toml".source = ../configs/helix/languages.toml;

      ".config/ghostty/config".source = ../configs/ghostty/config;
      ".config/ghostty/themes/ferra".source = ../configs/ghostty/themes/ferra;

      ".aerospace.toml".source = ../configs/aerospace.toml;
    };
  };

  programs = {
    # aerospace = {
    #   enable = true;
    #   userSettings = {
    #     start-at-login = true;
    #   };
    # };

    btop = {
        enable = true;
    };

    git = {
      enable = true;
      userName = "Cyrus Knopf";
      ignores = [".DS_STORE"];
      extraConfig = {
        core.editor = "hx";
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
      };
    };

    tmux = {
      enable = true;
      extraConfig = builtins.readFile ../configs/tmux.conf;
      plugins = [
        inputs.minimal-tmux.packages.${pkgs.system}.default
      ];
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
