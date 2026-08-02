{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.graceful = true;


  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";

  users.users.cyrus = {
    isNormalUser = true;
    description = "Cyrus Knopf";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      zsh
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  environment.systemPackages = with pkgs; [
    # Wayland / desktop
    waybar
    mako
    libnotify
    swww
    rofi
    hyprland
    wl-clipboard
    polkit
    xwayland
    brightnessctl

    # General tools
    git
    kitty
    gnome-terminal
    libinput
    usbutils
    helix
    firefox
    python3
    gcc

    # Nix tooling
    cachix
    nixd
  ];

  security.polkit.enable = true;

  services.openssh.enable = true;

  services.seatd.enable = true;

  services.acpid.enable = true;

  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "suspend";
    lidSwitchExternalPower = "suspend";
  };

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  system.stateVersion = "24.11";
}
