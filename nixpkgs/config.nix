{ pkgs }:
{
  allowBroken = true;
  allowUnfree = true;
  chromium.enableAdobeFlash = true;
  firefox.enableAdobeFlash = true;
  packageOverrides = super: let pkgs = super.pkgs; in with pkgs; rec {
    shell-env = pkgs.buildEnv {
      name = "shell-env";
      paths = [
        tmux 
      ];
    };
  };
}
