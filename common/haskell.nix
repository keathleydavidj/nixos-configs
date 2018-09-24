{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        stack
        ghc
        cabal2nix
        haskellPackages.hlint
    ];
}