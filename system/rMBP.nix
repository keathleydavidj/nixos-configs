{ config, pkgs, ... }:

{  
  environment = {
    shellAliases = {
      startnginx = "sudo nginx -c /usr/local/etc/nginx/nginx.conf";
    };
    systemPackages = with pkgs; [
      # chunkwm
      htop
      # khd
      nginx
      vscode-with-extensions
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
      "darwin=$HOME/.nix-defexpr/darwin"
      "nixpkgs=$HOME/.nix-defexpr/nixpkgs"
      "darwin-config=$HOME/nixos-configs/rMBP.nix"
      "$HOME/.nix-defexpr/channels"
    ];
  };

  system = {
    defaults = {
      dock.mru-spaces = true;
      dock.minimize-to-application = true;

      finder.AppleShowAllExtensions = true;
      finder.QuitMenuItem = true;
      finder.FXEnableExtensionChangeWarning = false;

      trackpad.Clicking = true;
      trackpad.TrackpadRightClick = true;
    };
  };
}
