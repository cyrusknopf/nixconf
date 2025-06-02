{
  # config,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];

  environment = {
    systemPackages = with pkgs; [
      # System wide packages
      # $ nix-env -qaP | grep wget

      nixd
      libcxx

      texlab

      vim
      neovim
      tmux

      ripgrep
      neofetch
      htop
      wget

      tree-sitter
      nixd

      aerospace
    ];
  };


  security = {
    pam.services.sudo_local = {
      touchIdAuth = true;
      reattach = true; # For tmux etc.
    };
  };

  services = {
    aerospace = {
      #enable = true;
      settings = pkgs.lib.importTOML ../configs/aerospace.toml;
    };
  };

  # Logging is disabled by default
  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
      enableBashCompletion = false;
    };
    man.enable = true;
  };

  networking = {
    hostName = "cyrus";
    computerName = "Cyrus' MacBook Pro";
  };

  fonts = {
    packages = with pkgs; [
        #nerd-fonts.JetBrainsMono
    ];
  };

  time = {
    timeZone = "Europe/London";
  };

  # https://mynixos.com/nix-darwin/options/system.defaults
  system = {
    primaryUser = "cyrus";

    defaults = {
      menuExtraClock.Show24Hour = false;
      NSGlobalDomain = {
        InitialKeyRepeat = 15;
        KeyRepeat = 1;

        AppleFontSmoothing = 2;
        AppleICUForce24HourTime = false;
        
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;

        AppleInterfaceStyle = "Dark";

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.trackpad.enableSecondaryClick" = false;
      };
      controlcenter = {
          AirDrop = false;
          BatteryShowPercentage = true;
          Bluetooth = true;
          Display = true;
          FocusModes = false;
          NowPlaying = false;
          Sound = false;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.1;
        autohide-time-modifier = 0.75;
        minimize-to-application = true;
        show-recents = false;
        static-only = true;

        wvous-bl-corner = 1; # bottom left
        wvous-br-corner = 14;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        ShowPathbar = true;
        CreateDesktop = false;
        FXRemoveOldTrashItems = true; # Remove items after 30 days from trash
        #QuitMenuItem = true; # Allow quitting
      };
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
        LoginwindowText = "Zen";
      };
      LaunchServices.LSQuarantine = true;
      #spaces.spans-displays = false;
    };
  };
}
