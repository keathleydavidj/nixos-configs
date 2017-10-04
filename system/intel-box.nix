{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  system.stateVersion = "17.09";
  system.activationScripts = {
    etc-setup = {
      text = ''
        ln -sfn /home/endertux/nixos-configs/intel-box.nix /etc/nixos/configuration.nix
      '';
      deps = [];
    };
  };

  networking.hostName = "nixos-intel";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  time.timeZone = "America/Chicago";

  environment.systemPackages = with pkgs; [
    efibootmgr
  ];

  hardware = {
    pulseaudio.enable = true;
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/cd32e15c-4f68-4c31-8e22-2e45a49fad06";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/223fc2a5-3933-4b17-adca-1e669df22b60"; }
    ];

  nix.maxJobs = 4;

  powerManagement.cpuFreqGovernor = "powersave";
}
