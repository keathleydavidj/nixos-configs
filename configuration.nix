{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = { 
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  hardware.pulseaudio.enable = true;

  time.timeZone = "America/Chicago";

  environment = {
    pathsToLink = [ "$HOME/.nix-profile/bin" ];
    systemPackages = with pkgs; [
      chromium
      dmenu
      git
      google-play-music-desktop-player
      ntfs3g
      silver-searcher
      transmission_gtk
      rxvt_unicode
      vim_configurable
      vlc
    ];
  };

  services = {
    nix-serve.enable = true;
    nixosManual.showManual = true;
    transmission.enable = true;
    unifi.enable = true;
    urxvtd = {
      enable = true;
    };
    redshift = {
      enable = true;
      latitude = "30";
      longitude = "-97";
      temperature.day = 5600;
      temperature.night = 2700;
    };
    xserver = {
      enable = true;
      autorun = true;
      desktopManager = {
        gnome3 = {
          enable = true;
        };
      };
      videoDrivers = [ "amdgpu-pro" ];
    };
  };

  fonts = {
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      google-fonts
      powerline-fonts
      source-code-pro
      terminus_font
      ubuntu_font_family
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif     = [ "Source Serif Pro" ];
      };
    };
  };

  programs = {
    fish.enable = true;
  };
  
  users = {
    defaultUserShell = pkgs.fish;
    extraUsers.endertux = {
      isNormalUser = true;
      extraGroups =  [
        "adbusers"
        "networkmanager" 
        "wheel" 
      ];
    };
  };

  nix = {
    autoOptimiseStore = true;
    gc.automatic = true;
    maxJobs = 16;
    trustedBinaryCaches = [
      "http://hydra.cryp.to"
      "http://hydra.nixos.org"
    ];
    nixPath = [
      "nixpkgs=$HOME/.nix-defexpr/nixpkgs"
      "$HOME/.nix-defexpr/channels"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  system = {
    activationScripts = {
      config-files = {
        text = ''
          ln -sfn /home/endertux/.nixpkgs /etc/nixos
        '';
        deps = [];
      };
    };
    stateVersion = "17.09";
    autoUpgrade = {
      enable = true;
      channel = https://nixos.org/channels/nixos-17.09;
    };
  };

}
