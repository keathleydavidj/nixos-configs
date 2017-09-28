{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos-intel";
    networkmanager.enable = true;
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Chicago";

  fonts = {
    fonts = with pkgs; [
      dejavu_fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
    ];
    fontconfig = {
      penultimate.enable = false;
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif     = [ "Source Serif Pro" ];
      };
    };
  };

  nix = {
    trustedBinaryCaches = [
      "http://hydra.cryp.to"
      "http://hydra.nixos.org"
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      iptables
      lm_sensors
      manpages
    ];
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
      desktopManager = {
        gnome3.enable = true;
        default = "gnome3";
      };
    };
    gnome3 = {
      tracker.enable = false;
      gnome-keyring.enable = true;
    };
    redshift = {
      enable = true;
      # Austin
      latitude = "30.274591";
      longitude = "-97.740375";
    };
    postgresql = {
      enable = true;
      package = pkgs.postgresql94;
      authentication = lib.mkForce ''
        # Generated file; do not edit!
        # TYPE  DATABASE        USER            ADDRESS                 METHOD
        local   all             all                                     trust
        host    all             all             127.0.0.1/32            trust
        host    all             all             ::1/128                 trust
      '';
    };
    nixosManual.showManual = true;
  };

  programs = {
    adb.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    extraUsers.endertux = {
      group = "users";
      extraGroups =  [
        "adbusers"
        "networkmanager"
        "wheel"
      ];
      home = "/home/endertux";
      createHome = true;
      useDefaultShell = true;
      password = "dummy"; # first boot only
      uid = 1000;
    };
  };

  system = {
    stateVersion = "17.09";
    autoUpgrade = {
      enable = true;
      channel = https://nixos.org/channels/nixos-17.09;
    };
  };

}
