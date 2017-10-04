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

  hardware = {
    ## Steam support ##
    opengl.driSupport32Bit = true;
    pulseaudio.support32Bit = true;
  };

  networking = {
    hostName = "nixos-intel";
    networkmanager.enable = true;
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
    shellAliases = {
      c = "clear";
      ts = "tig status";
    };

    systemPackages = with pkgs; [
      fzf
      git
      silver-searcher
      tig
      vscode-with-extensions
    ];

    variables = {
      # FZF_DEFAULT_COMMAND = "ag -l -f -g ''";
    };
  };

  services = {
    gnome3 = {
      tracker.enable = false;
      gnome-keyring.enable = true;
    };

    nixosManual.showManual = true;

    # TODO: migrate to 17.09
    # postgresql = {
    #   enable = true;
    #   package = pkgs.postgresql94;
    #   authentication = lib.mkForce ''
    #     # Generated file; do not edit!
    #     # TYPE  DATABASE        USER            ADDRESS                 METHOD
    #     local   all             all                                     trust
    #     host    all             all             127.0.0.1/32            trust
    #     host    all             all             ::1/128                 trust
    #   '';
    # };

    redshift = {
      enable = true;
      # Austin
      latitude = "30.274591";
      longitude = "-97.740375";
    };

    ## Steam controller support ##
    udev.extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"
      KERNEL=="uinput", MODE="0660", GROUP="users", OPTIONS+="static_node=uinput"
    '';

    xserver = {
      enable = true;
      desktopManager = {
        gnome3.enable = true;
        default = "gnome3";
      };
    };
  };

  programs = {
    adb.enable = true;
    fish = {
      enable = true;
    };
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
      home = "/home/endertux";
      password = "dummy"; # first boot only
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
