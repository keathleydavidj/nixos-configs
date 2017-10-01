{ config, lib, pkgs, ... }:
{
  time.timeZone = "America/Chicago";

  environment = {
    shellAliases = {
      c = "clear";
      ts = "tig status";
    };
    systemPackages = with pkgs; [
      fzf
      git
      htop
      nix
      silver-searcher
      tig
    ];
    systemPath = [ "$HOME/.nix-profile/bin" ];
    variables = {
      FZF_DEFAULT_COMMAND = "ag -l -f -g ''";
    };
  };

  programs = {
    tmux = {
      enable = true;
      enableSensible = true;
      enableVim = true;
    };
    vim = {
      enable = true;
      enableSensible = true;
      plugins = [
        { names = [
            "ale"
            "colors-solarized"
            "commentary"
            "fzfWrapper"
            "vim-gitgutter"
            "vim-indent-object"
            "vim-nix"
            "youcompleteme"
          ];
        }
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
        PROMPT='%B%(?..%? )%b⇒ '
        RPROMPT='%F{green}%~%f'
      '';
      variables = {
        cfg = "$HOME/.nixpkgs/darwin-config.nix";
        darwin = "$HOME/.nix-defexpr/darwin";
        pkgs = "$HOME/.nix-defexpr/nixpkgs";
      };
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
    useSandbox = "relaxed";
  };

  nipkgs.config = {
    allowUnfree = true;
  };
  
}

