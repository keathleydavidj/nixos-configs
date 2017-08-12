{ config, pkgs, ... }:

let

  urxvtConfig = import ./urxvt_config.nix pkgs;

  nvimConfig = import ./neovim_config.nix;

in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.pulseaudio.enable = true;

  networking.hostName = "nixos-intel";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    consoleUseXkbConfig = true;
  };

  time.timeZone = "America/Chicago";
  
  nixpkgs.config = {
    allowUnfree = true;
    chromium.enableAdobeFlash = true;
    firefox.enableAdobeFlash = true;
    packageOverrides = pkgs: {
      neovim = pkgs.neovim.override nvimConfig;
    };
  };

  environment.systemPackages = with pkgs; [
    nix
    nix-repl

    chromium
    exfat
    firefox
    git
    gnome3.gnome-tweak-tool
    gnome3.gdm
    htop
    iptables
    ldm
    lm_sensors
    manpages
    nodejs
    neovim
    silver-searcher
    sudo
    openssh
    transmission_gtk
    tree
    rxvt_unicode
    vlc
    wget
    xclip
    xfontsel
    zsh
    zsh-syntax-highlighting
  ];

  services = {
    ntp.enable = true;
    printing.enable = true;
    nixosManual.showManual = true;

    redshift = {
      enable = true;
      latitude = "30";
      longitude = "-97";
      temperature.day = 5600;
      temperature.night = 2700;
    };

    gnome3 = {
      tracker.enable = false;
      gnome-keyring.enable = true;
    };
  
    xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "ctrl:nocaps";
      xkbVariant = "colemak";

      desktopManager.gnome3.enable = true;
      displayManager.gdm.enable = true;
      displayManager.sessionCommands = urxvtConfig; 
      
    };
  };

  programs = {
    adb.enable = true;

    tmux = {
      enable = true;
      terminal = "screen-256color";
      keyMode = "vi";
      escapeTime = 0;
    };

    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
	      c = "clear";
        l = "ls -alh";
        ll = "ls -l";
        ls = "ls --color=tty";
      };
    };
  };
  
  # users.mutableUsers = false;

  users.defaultUserShell = pkgs.zsh;
  users.extraUsers.endertux = {
    createHome = true;
    home = "/home/endertux";
    description = "David Keathley";
    extraGroups =  [ "adbusers" "wheel" ];
    isSystemUser = false;
    useDefaultShell = true;
  };

  security.sudo.enable = true;


  system = {
    # The NixOS release to be compatible with for stateful data such as databases.
    stateVersion = "17.03";
    autoUpgrade = {
      enable = true;
      channel = https://nixos.org/channels/nixos-17.03;
    };
  };

}
