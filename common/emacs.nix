{ pkgs, ... }:

{
  services.emacs = {
    enable = true;
    package = pkgs.myMacEmacs;
  };

  environment.systemPackages = [
    pkgs.myMacEmacs
  ];
}