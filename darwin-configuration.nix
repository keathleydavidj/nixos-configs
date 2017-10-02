{ config, pkgs, ... }:

{
  time.timeZone = "America/Chicago";

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreeRedistributable = true;
    packageOverrides = pkgs: rec {
      chunkwm = pkgs.callPackage ./chunkwm/default.nix {
        inherit (pkgs.darwin.apple_sdk.frameworks) Carbon Cocoa ApplicationServices;
      };
    };
  };
  environment = {
    shellAliases = {
      c = "clear";
      ts = "tig status";
    };
    systemPackages = with pkgs; [
      chunkwm
      fzf
      git
      htop
      khd
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
    gc.automatic = true;
    maxJobs = 8;
    nixPath = [ # Use local nixpkgs checkout instead of channels.
      "darwin=$HOME/.nix-defexpr/darwin"
      "nixpkgs=$HOME/.nix-defexpr/nixpkgs"
      "darwin-config=$HOME/.nixpkgs/darwin-configuration.nix"
      "$HOME/.nix-defexpr/channels"
    ];
  };
}

