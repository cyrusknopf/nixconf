{ self, pkgs, username, linuxHomedir, darwinHomedir, ... }:
 # Home manager settings
{
  home = {
    stateVersion = "23.05";

    username = username;
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/cyrus" else "/home/cyrus";

    packages = let
      darwinPackages = if pkgs.stdenv.isDarwin then with pkgs; [
      ] else [];

      linuxPackages = if !pkgs.stdenv.isDarwin then with pkgs; [
      ] else [];
    in
      with pkgs; [
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
      ] ++ darwinPackages ++ linuxPackages;

    sessionVariables = {
      EDITOR = "hx";
    };

    file = {
        ".zshrc".source = "${self}/configs/zshrc";
        ".zshenv".source = "${self}/configs/zshenv";
        ".p10k.zsh".source = "${self}/configs/p10k.zsh";
        ".clangd".source = "${self}/configs/.clangd";

        ".tmux.conf".source = "${self}/configs/tmux.conf";

        ".config/helix/config.toml".source = "${self}/configs/helix/config.toml";
        ".config/helix/languages.toml".source = "${self}/configs/helix/languages.toml";

        ".config/ghostty/config".source = "${self}/configs/ghostty/config";
        ".config/ghostty/themes/ferra".source = "${self}/configs/ghostty/themes/ferra";

        ".aerospace.toml".source = "${self}/configs/aerospace.toml";
    };
  };

  programs.home-manager.enable = true;

  programs.zsh.enable = true;

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Cyrus Knopf";
        email = "cyrus.knopf@gmail.com";
      };
    };
    
    ignores = [".DS_STORE"];
    lfs.enable = true;
    settings = {
      core.editor = "hx";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../configs/tmux.conf;

    plugins = [
      # inputs.minimal-tmux.packages.${pkgs.system}.default
    ];
    
  };
}
