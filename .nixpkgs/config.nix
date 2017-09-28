{
  allowUnfree = true;
  chromium.enableAdobeFlash = true;
  firefox.enableAdobeFlash = true;
  pulseaudio = true;
  packageOverrides = pkgs:
  let
    tor-browser = pkgs.tor-browser-bundle-bin.override {
      extraPrefs = ''
        lockPref("browser.tabs.remote.autostart", false);
        lockPref("browser.tabs.remote.autostart.2", false);
      '';
    };
  in
  rec {
    userspace = with pkgs; buildEnv {
      name = "userspace";
      paths = [
        curl
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
      ];
    };

    desktop-env = with pkgs; buildEnv {
      name = "desktop-env";
      paths = [
        atom-beta
        chromium
        firefox
        gnome3.gnome-tweak-tool
        google-play-music-desktop-player
        tor
        tor-browser
        transmission_gtk
        rxvt_unicode
        vlc
      ];
    };
  };
}
