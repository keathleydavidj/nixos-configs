{ config, pkgs, ... }:

{
  require = [
    ./system/ryzender.nix

    ./common/boot.nix
    ./common/user.nix
    ./common/base.nix
    ./common/desktop.nix
  ];
}

