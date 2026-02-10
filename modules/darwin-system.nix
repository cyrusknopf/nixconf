{ pkgs, username, darwinHomedir, ...}:

{
  system.stateVersion = 5;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users.${username} = {
    home = darwinHomedir;
  };

  # Darwin specific pkgs?
  environment.systemPackages = with pkgs; [
    libcxx
  ];

  homebrew = {
    enable = true;
    brews = [ "watch" ];
    casks = [ "ghostty" "arc" "raycast" ];
  };

  security.pam.services.sudo_local = {
    touchIdAuth = false;
    reattach = true;
  };

  networking = {
    hostName = "cyrus";
    computerName = "Cyrus' MacBook";
  };

  fonts.packages = with pkgs; [ ];

  time.timeZone = "Europe/London";

  programs.zsh.enable = true;
  programs.man.enable = true;

  # MacBook specific Apple settings
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
          NowPlaying = true;
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
