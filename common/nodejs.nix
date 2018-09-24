{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs-10_x
    nodePackages.bower
    # nodePackages.ember-cli
    nodePackages.eslint
    nodePackages.typescript
    nodePackages.yarn
  ];
}
