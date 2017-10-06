{ ... }:

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

  networking.hostName = "ryzender";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/26d78db7-8e7b-4978-be23-078e0e8e78f5";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/99ab2dd9-470a-4dde-b7d5-b058269c007d";
      fsType = "ext4";
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/650b751f-d74a-4753-a7c7-ae45f20ff87d";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/3b97d5c3-4ab1-4a97-9b45-b6acd2a6bd18"; }
    ];

  nix.maxJobs = 16;
  powerManagement.cpuFreqGovernor = "ondemand";
}
