{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package = pkgs.emacs25Macport;
  };

  environment.systemPackages = [
    pkgs.emacs25Macport
  ];
}