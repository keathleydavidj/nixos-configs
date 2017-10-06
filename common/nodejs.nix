{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages.bower
    nodePackages.eslint
    nodePackages.yarn
  ];
}
