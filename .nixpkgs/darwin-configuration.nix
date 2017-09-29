{ config, lib, pkgs, ... }:
{

  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {
    shellAliases = {
      c = "clear";
      ts = "tig status"
    };
    systemPackages = with pkgs; [ 
      curl
      chunkwm
      fzf
      git
      htop
      khd
      nix-repl
      silver-searcher
      tig
    ];
  };

  programs = {
    fish = {
      enable = true;
    };
    tmux = {
      enable = true;
      enableSensible = true;
      enableVim = true;
    };
    vim = {
      enable = true;
      enableSensible = true;
      plugins = [ 
        { names = [ "ale" "vim-gitgutter" "commentary" ] }
        { names = [ "fzfWrapper" "youcompleteme" "colors-colarized" ] }
      ];
      vimConfig = ''
        colorscheme solarized
        set bg=dark
      
        set clipboard=unnamed
        set relativenumber
      '';
    };
    zsh = {
      enable = true;
      enableBashCompletion = true;
      enableFzfCompletion = true;
      enableFzfGit = true;
      enableFzfHistory = true;
      promptInit = ''
        autoload -U promptinit && promptinit
      '';
  };

  # Recreate /run/current-system symlink after boot.
  services = {
    activate-system.enable = true;
    postgresql.enable = true;
    chunkwm = {
      enable = true;
      extraConfig = ''
      chunkc tiling::rule --owner iTerm2 --state tile
      '';
    };
  };

  nix = {
    gc.automatic = true;
    maxJobs = 4;
    useSandbox = true;
  }; 
}
