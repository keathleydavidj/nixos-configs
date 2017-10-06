{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package = pkgs.myEmacs;
  };

  environment.systemPackages = [
    pkgs.myEmacs
  ];
}