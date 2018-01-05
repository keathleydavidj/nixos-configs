{ config, pkgs, ... }:

{  
  environment = {
    shellAliases = {
      startnginx = "sudo nginx -c /usr/local/etc/nginx/nginx.conf";
    };
    systemPackages = with pkgs; [
      htop
      nginx
      neovim
    ];
    systemPath = [ "$HOME/.nix-profile/bin" ];
  };

  services = {
    activate-system.enable = true;
  };

  nix = {
    package = pkgs.nixUnstable;
    maxJobs = 8;
    gc.automatic = true;
    nixPath = [ # Use local nixpkgs checkout instead of channels.
      "nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs"
      "nixpkgs-overlays=$HOME/.nixpkgs/overlays"
      "darwin=$HOME/.nix-defexpr/channels/darwin"
      "darwin-config=$HOME/.nixpkgs/rMBP.nix"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  system = {
    defaults = {
      NSGlobalDomain.AppleKeyboardUIMode = 3;
      NSGlobalDomain.ApplePressAndHoldEnabled = false;
      NSGlobalDomain.InitialKeyRepeat = 10;
      NSGlobalDomain.KeyRepeat = 1;
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
