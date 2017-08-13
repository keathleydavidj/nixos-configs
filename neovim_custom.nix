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
        "elm-vim"
        "gitgutter"
        "gruvbox"
        "nerdtree"
        "surround"
        "tmux-navigator"
        "polyglot"
        "vim-nix"
        "vim-orgmode"
        ];
      }

      { 
        names = [
          "ghc-mod-vim"
          "hlint-refactor"
          "hoogle"
        ];
        ft_regex = "^\.hs$";
      }
    ];
  };
}
