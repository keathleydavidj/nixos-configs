{ config, pkgs, ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    ./common/nodejs.nix
    ./common/tmux.nix
  ];
}