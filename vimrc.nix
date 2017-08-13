{ stdenv, writeText }:

let
    vimrc = builtins.readFile ./vimrc/vimrc.vim;

in

''
    ${vimrc}
''
