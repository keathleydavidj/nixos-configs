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
        "airline"
        "ale"
        "commentary"
        "gitgutter"
        "gruvbox"
        "nerdtree"
        "Solarized"
        "syntastic"
        "surround"
        "tmux-navigator"
        "polyglot"
        "vim-orgmode"
        ];
      }

      {
        name = "elm-vim";
        ft_regex = "^\.elm$"
      }

      { 
        names = [
          "ghc-mod-vim"
          "hlint-refactor"
          "hoogle"
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
