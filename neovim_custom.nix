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
        "commentary"
        "gruvbox"
        "Solarized"
        "Syntastic"
        "surround"
        "The_NERD_tree"
        "vim-airline"
        "vim-gitgutter"
        "vim-polyglot"
        ];
      }

      {
        name = "elm-vim";
        ft_regex = "^\.elm$"
      }

      { 
        names = [
          "ghcmod"
          "Hoogle"
        ];
        ft_regex = "^\.hs$";
      }

      {
        name = "vim-nix";
        ft_regex = "^\.nix$";
      }
    ];
  };
}
