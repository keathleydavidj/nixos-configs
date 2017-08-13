{ pkgs, ... }:

let
  vimrc   = pkgs.callPackage ./vimrc.nix {};
  plugins = pkgs.callPackage ./plugins.nix {};
in

{
  vimAlias = false;
  configure = {
    customRC = vimrc;

    vam.knownPlugins = pkgs.vimPlugins // plugins;
    vam.pluginDictionaries = [
      { names = [
        "Hoogle"
        "Solarized"
        "Syntastic"
        # "UltiSnips"
        "commentary"
        "ghcmod"
        "surround"
        "vim-gitgutter"
        "vim-nix"
        ];
      }
    ];
  };
}
