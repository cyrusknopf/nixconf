{ pkgs, ... }:

{
  home = {

  stateVersion = "23.05";

  packages = with pkgs; [
    nixd
    tree-sitter
    marksman
    codebook

    vim
    helix

    neofetch
    htop
    wget
    entr

    sioyek
    # obsidian
  ];

  sessionVariables = {
    EDITOR = "hx";
  };

  file = {
      ".zshrc".source = ../configs/zshrc;
      ".p10k.zsh".source = ../configs/p10k.zsh;
      ".clangd".source = ../configs/.clangd;

      ".config/helix/config.toml".source = ../configs/helix/config.toml;
      ".config/helix/languages.toml".source = ../configs/helix/languages.toml;

      ".config/ghostty/config".source = ../configs/ghostty/config;
      ".config/ghostty/themes/ferra".source = ../configs/ghostty/themes/ferra;

      ".aerospace.toml".source = ../configs/aerospace.toml;
  };

  /*
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
  */
  };
}
