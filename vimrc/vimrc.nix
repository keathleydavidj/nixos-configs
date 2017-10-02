{ stdenv, writeText }:

let
  vimrc       = builtins.readFile ./vimrc/vimrc.vim;

  ale         = builtins.readFile ./vimrc/ale.vim;

  elm-vim     = builtins.readFile ./vimrc/elm-vim.vim;
    
  nerdtree    = builtins.readFile ./vimrc/nerdtree.vim;
    
  gruvbox     = builtins.readFile ./vimrc/gruvbox.vim;
    
  vim-airline = builtins.readFile ./vimrc/vim-airline.vim;

in

''
    ${vimrc}
    
    ${vim-airline}

    ${nerdtree}

    ${gruvbox}

    ${elm-vim}

    ${ale}
''
