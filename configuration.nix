{ config, pkgs, ... }:

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
      neovim = pkgs.neovim.override (import ./neovim_config.nix);
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
      displayManager.sessionCommands = ''
        xrdb "${pkgs.writeText "xrdb.conf" ''
          URxvt.font:              xft:Source Code Pro Light:size=12
          URxvt.letterSpace:       0
          
          URxvt.background:        #121214
          URxvt.foreground:        #FFFFFF
          ! black
          URxvt.color0:            #2E3436
          URxvt.color8:            #555753
          ! red
          URxvt.color1:            #CC0000
          URxvt.color9:            #EF2929
          ! green
          URxvt.color2:            #4E9A06
          URxvt.color10:           #8AE234
          ! yellow
          URxvt.color3:            #C4A000
          URxvt.color11:           #FCE94F
          ! blue
          URxvt.color4:            #3465A4
          URxvt.color12:           #729FCF
          ! magenta
          URxvt.color5:            #75507B
          URxvt.color13:           #AD7FA8
          ! cyan
          URxvt.color6:            #D3D7CF
          URxvt.color14:           #34E2E2
          ! white
          URxvt.color7:            #D3D7CF
          URxvt.color15:           #EEEEEC
          
          URxvt*saveLines:         32767
          
          URxvt.colorUrl:          #AED210
          
          Xft*dpi:                 128
          Xft*antialias:           true
          Xft*hinting:             full
          
          URxvt.scrollBar:         false
          URxvt*scrollTtyKeypress: true
          URxvt*scrollTtyOutput:   false
          URxvt*scrollWithBuffer:  false
          URxvt*scrollStyle:       plain
          URxvt*secondaryScroll:   true
          
          Xft.autohint:            0
          Xft.lcdFilter:           lcddefault
          Xft.hintstyle:           hintfull
          Xft.hinting:             1
          Xft.antialias:           1
        '' }"
      '';
      
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
