{ config, pkgs, ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    ./common/emacs.nix
    ./common/nodejs.nix
    ./common/tmux.nix
  ];
}