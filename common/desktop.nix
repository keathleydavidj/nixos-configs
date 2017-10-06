{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    google-play-music-desktop-player
    (
      tor-browser-bundle-bin.override {
        extraPrefs = ''
          lockPref("browser.tabs.remote.autostart", false);
          lockpref("browser.tabs.remote.autostart.2", false);
        '';
      }
    )
    transmission_gtk
    vlc
  ];

  services = {
    redshift = {
      enable = true;
      latitude = "30.274591";
      longitude = "-97.740375";
    };

    xserver = {
      enable= true;
      displayManager.lightdm.enable = true;

      desktopManager.default = "gnome3";
      desktopManager.gnome3.enable = true;
      desktopManager.xterm.enable = false;
    };

    gnome3 = {
      tracker.enable = false;
      gnome-keyring.enable = true;
    };
  };
  
  fonts = {
    fonts = with pkgs; [
      source-code-pro
      source-sans-pro
      source-serif-pro
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif     = [ "Source Serif Pro" ];
      };
    };
  };
}
