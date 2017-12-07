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
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixpkgs"
      "nixpkgs-overlays=$HOME/.nixpkgs/overlays"
      "darwin=$HOME/.nix-defexpr/channels/darwin"
      "darwin-config=$HOME/.nixpkgs/rMBP.nix"
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
