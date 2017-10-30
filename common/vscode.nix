{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    my-vscode
  ];
} 