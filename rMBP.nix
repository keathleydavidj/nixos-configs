{ ... }:

{
  require = [
    ./system/rMBP.nix

    ./common/base.nix
    # ./common/emacs.nix
    ./common/nodejs.nix
    ./common/tmux.nix
    # ./common/vim.nix
    ./common/yi.nix
  ];
}