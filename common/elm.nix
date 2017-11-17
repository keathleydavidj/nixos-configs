{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    elmPackages.elm
    elmPackages.elm-compiler
    elmPackages.elm-format
    elmPackages.elm-make
    elmPackages.elm-package
    elmPackages.elm-reactor
    elmPackages.elm-repl
  ];
}