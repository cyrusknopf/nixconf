{ pkgs, username, linuxHomedir, darwinHomedir, ... }:

# Home manager settings
{
  home = {
    username = username;
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/cyrus" else "/home/cyrus";
  };

  programs.zsh.enable = true;
  programs.git.enable = true;
}
