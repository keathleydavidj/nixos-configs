{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages.bower
    # nodePackages.ember-cli
    nodePackages.eslint
    # nodePackages.eslint-plugin-mocha
    nodePackages.yarn
  ];
}
