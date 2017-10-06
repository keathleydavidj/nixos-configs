# Local package definitions, adapted from:
#
#   Managing private Nix packages outside the Nixpkgs tree
#   http://sandervanderburg.blogspot.dk/2014/07/managing-private-nix-packages-outside.html
#
{ pkgs ? import <nixpkgs> {} }:

let
    # Define a callPackage function to be callPackageWith where the auto arguments
    # are the a combination of the self defined packages and the default nix packages.
    #
    # NOTE: self is prioritized over pkgs as it is specified last.
    #
    callPackage = pkgs.lib.callPackageWith (pkgs // self);

    # Custom package definitions
    self = rec {
        # neovim_custom = callPackage ./neovim_custom {};
    };

in
    self
