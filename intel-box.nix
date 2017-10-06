{ ... }:

{
  require = [
    ./system/intel-box.nix

    ./common/boot.nix
    ./common/user.nix
    ./common/base.nix
    ./common/desktop.nix
    ./common/steam.nix 
  ];
}
