self: super:

{
  neovim = super.neovim.override {
    vimAlias = true;
    configure = {
      vam.knownPlugins = self.vimPlugins;
      vam.pluginDictionaries = [
        { 
          names = [
            "commentary"
            "surround"
            "tmux-navigator"
            "vim-nix"
          ];
        }
      ];
      customRC = ''
let mapleader="\<Space>"

set encoding=utf8
set undofile
set undodir=~/.local/undo
set undolevels=100

set history=5000
set noswapfile

set equalalways

set number

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=""<CR>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <c-w>v

" Tabs, spaces, wrapping
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=+1

" Don't let Vim hide characters or make loud dings
set conceallevel=1
set noerrorbells

" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

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
    };
  };
}