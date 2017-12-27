{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        stack
        ghc
        haskellPackages.hlint
        haskellPackages.ghc-mod
    ];
}