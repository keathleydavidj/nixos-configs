{ pkgs, ... }:

let
  plugins = pkgs.callPackage ./plugins.nix {};
in

{
  vimAlias = false;
  configure = {
    customRC = ''
      let mapleader="\<Space>"
      
      set number
      
      set history=5000
      set noswapfile

      set equalalways

      " Clean whitespace
      map <leader>W :%s/\s\+$//<cr>:let @/=""<CR>

      " Easy buffer navigation
      noremap <C-h>  <C-w>h
      noremap <C-j>  <C-w>j
      noremap <C-k>  <C-w>k
      noremap <C-l>  <C-w>l
      noremap <leader>v <c-w>v

      " Tabs, spaces, wrapping
      set tabstop=4
      set shiftwidth=4
      set softtabstop=4
      set expandtab
      set wrap
      set textwidth=79
      set formatoptions=qrn1
      set colorcolumn=+1

      " neovim
      if has("nvim")
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        tnoremap <Esc> <C-\><C-n>
        tnoremap <C-h> <C-\><C-n><C-w>h
        tnoremap <C-j> <C-\><C-n><C-w>j
        tnoremap <C-k> <C-\><C-n><C-w>k
        tnoremap <C-l> <C-\><C-n><C-w>l
        autocmd BufWinEnter,WinEnter term://* startinsert
        autocmd BufLeave term://* stopinsert
      endif

    '';

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
