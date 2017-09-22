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
        exfat
        git
        htop
        nix
        nix-repl
        nodejs
        vim_configurable
        silver-searcher
        sudo
        openssh
        tig
        tmux
        wget
      ];
    };
    desktop-env = {
      name = "desktop-env";
      paths = with pkgs; [
        atom-beta
        chromium
        firefox
        gnome3.gnome-tweak-tool
        google-play-music-desktop-player
        transmission_gtk
        rxvt_unicode
        vlc
      ];
    };
  };
}
