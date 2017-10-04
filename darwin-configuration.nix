{ config, pkgs, ... }:

{
  time.timeZone = "America/Chicago";

  environment = {
    shellAliases = {
      c = "clear";
      ts = "tig status";
      startnginx = "sudo nginx -c /usr/local/etc/nginx/nginx.conf";
    };
    systemPackages = with pkgs; [
      # chunkwm
      fzf
      git
      htop
      # khd
      nginx
      nix
      nodejs
      silver-searcher
      tig
      vscode-with-extensions
    ];
    systemPath = [ "$HOME/.nix-profile/bin" ];
    variables = {
      FZF_DEFAULT_COMMAND = "ag -l -f -g ''";
    };
  };

  programs = {
    fish.enable = true;
    tmux = {
      enable = true;
    };
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
      "darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"
      "$HOME/.nix-defexpr/channels"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreeRedistributable = true;
  };
}

