{ pkgs, ... }:

{
  environnment.systemPackages = with pkgs; [
    nodejs
    nodePackages.yarn
  ];
}
