{ ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    #./common/elm.nix
    ./common/nodejs.nix
    ./common/haskell.nix
    # ./common/tmux.nix
    # ./common/vscode.nix
    ./common/emacs.nix
    # ./common/vim.nix
    # ./common/yi.nix
  ];
}
