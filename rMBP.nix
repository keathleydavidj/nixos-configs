{ ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    ./common/elm.nix
    ./common/haskell.nix
    ./common/nodejs.nix
  ];
}
