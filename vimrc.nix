{ stdenv, writeText }:

let
    vimrc    = builtins.readFile ./vimrc/vimrc.vim;
    nerdtree = builtins.readFile ./vimrc/nerdtree.vim;

in

''
    ${vimrc}
    
    ${nerdtree}
''
