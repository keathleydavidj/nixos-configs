{ ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    ./common/nodejs.nix
    ./common/haskell.nix
    ./common/ruby.nix
    ./common/emacs.nix
  ];
}
