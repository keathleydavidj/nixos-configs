{ pkgs, ... }:

{
  nixpkgs.config.allowBroken = true;
  environment.systemPackages = with pkgs; [
    yi-my
  ];
}