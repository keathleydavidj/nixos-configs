{ config, pkgs, ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    ./common/nodejs.nix
    ./common/neovim.nix
    ./common/tmux.nix
  ];
}