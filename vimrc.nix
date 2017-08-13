{ stdenv, writeText }:

let
    vimrc       = builtins.readFile ./vimrc/vimrc.vim;

    elm-vim     = builtins.readFile ./vimrc/elm-vim.vim;
    
    syntastic.vim;

    nerdtree    = builtins.readFile ./vimrc/nerdtree.vim;
    
    gruvbox     = builtins.readFile ./vimrc/gruvbox.vim;
    
    vim-airline = builtins.readFile ./vimre/vim-airline.vim;

in

''
    ${vimrc}
    
    ${vim-airline}

    ${syntastic}

    ${nerdtree}

    ${gruvbox}

    ${elm-vim}
''
