" System settings

set path+=**
set wildmenu
set relativenumber number
set nowrap
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode


" keybindings
let mapleader="\<Space>"

nmap <silent> <C-l> :noh<CR>

vmap > >gv
vmap < <gv

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

nmap <leader>vim :find $MYVIMRC<CR>

nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

"export VIMINIT='let $MYVIMRC="~/dotfiles/init.vim" | source $MYVIMRC'
