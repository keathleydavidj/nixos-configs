{ config, pkgs, ... }:

{  
  environment = {
    systemPackages = with pkgs; [
      htop
      neovim
      leiningen
    ];
    systemPath = [ 
      "$HOME/.nix-profile/bin"
      "$HOME/.cask/bin"
      "/usr/local/bin" # for yarn
      ];
  };

  services = {
    activate-system.enable = true;
  };

  nix = {
    package = pkgs.nixUnstable;
    maxJobs = 8;
    gc.automatic = true;
    nixPath = [ # Use local nixpkgs checkout instead of channels.
      "nixpkgs=$HOME/.nix-defexpr/channels_root/nixpkgs"
      "nixpkgs-overlays=$HOME/.nixpkgs/overlays"
      "darwin=$HOME/.nix-defexpr/channels/darwin"
      "darwin-config=$HOME/.nixpkgs/rMBP.nix"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  users.users.davidkeathley = {
    password = "dummy"; # first boot only!
    uid = 1000;
    isHidden = false;
    home = "/Users/davidkeathley";
    shell = pkgs.fish;
  };

  system = {
    defaults = {
      NSGlobalDomain.AppleKeyboardUIMode = 3;
      NSGlobalDomain.ApplePressAndHoldEnabled = false;
      NSGlobalDomain.InitialKeyRepeat = 12;
      NSGlobalDomain.KeyRepeat = 4;
      NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
      NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;
      NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;
      NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;
      NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
      NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
      NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;

      dock.mru-spaces = true;
      dock.minimize-to-application = true;

      finder.AppleShowAllExtensions = true;
      finder.QuitMenuItem = true;
      finder.FXEnableExtensionChangeWarning = false;

      trackpad.Clicking = true;
      trackpad.TrackpadRightClick = true;
    };
  };

  ## GUI apps use the users bootstrap context and won't
  ## load anything from the shell by default
  launchd.user.envVariables.PATH = config.environment.systemPath;
}
