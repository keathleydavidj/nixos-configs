{ ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  system.stateVersion = "17.09";
  
  system.activationScripts = {
    etc-setup = {
      text = ''
        ln -sfn /home/endertux/.nixpkgs/ryzender.nix /etc/nixos/configuration.nix
      '';
      deps = [];
    };
  };

  networking.hostName = "ryzender";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "f2fs" ];


  fileSystems."/" =
    { device = "/dev/disk/by-uuid/61850dfb-7a3a-4e37-b65b-d7f912130008";
      fsType = "f2fs";
    };

  nix.maxJobs = 16;
  powerManagement.cpuFreqGovernor = "ondemand";
}
