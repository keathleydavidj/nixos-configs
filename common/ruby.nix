{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ruby_2_4
    bundix
    # bundler
  ];
}