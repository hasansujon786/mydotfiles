33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600   1) " vimrc: a monolithic vim setup. {{{1
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600   2) " © 2009-2013 Tom Vincent <http://tlvince.com/contact>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600   3) " vim: set fdm=marker:
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600   4) "
a148397f (hasansujon786     2020-02-28 14:32:48 +0600   5) " Bash setting to import init.vim
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600   6) "export VIMINIT='let $MYVIMRC="~/mydotfiles/nvim/init.vim" | source $MYVIMRC'
a148397f (hasansujon786     2020-02-28 14:32:48 +0600   7) " Or put it to default init.vim
00000000 (Not Committed Yet 2020-02-28 16:48:52 +0600   8) "if !empty(glob("~/mydotfiles/nvim/init.vim"))
00000000 (Not Committed Yet 2020-02-28 16:48:52 +0600   9)   "source ~/mydotfiles/nvim/init.vim
00000000 (Not Committed Yet 2020-02-28 16:48:52 +0600  10)   "echo 'Welcom to Neovim'
00000000 (Not Committed Yet 2020-02-28 16:48:52 +0600  11) "endif
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  12) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  13) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  14) " General preferences {{{1
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  15) "
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  16) " Learn about these using vim help.
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  17) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  18) " System
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  19) set path+=**
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  20) set wildmenu
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  21) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  22) " Number
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  23) set relativenumber number
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  24) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  25) " Tabbing
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  26) set tabstop=2           " The number of spaces a tab is
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  27) set shiftwidth=2        " Number of spaces to use in auto(indent)
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  28) set softtabstop=2       " Just to be clear
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  29) set expandtab           " Insert tabs as spaces
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  30) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  31) " Searching
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  32) set wrapscan            " Wrap searches
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  33) set ignorecase          " Ignore search term case...
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  34) set smartcase           " ... unless term contains an uppercase character
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  35) set hlsearch            " ... as you type
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  36) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  37) " Wrapping
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  38) set textwidth=80        " Hard-wrap text at nth column
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  39) set nowrap              " Don't wrap long lines (good for vsplits)
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  40) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  41) " General
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  42) set showmode            " Persistent notice of current mode
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  43) set spelllang=en_gb     " Speak proper English
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  44) set fillchars=""        " Remove characters in window split
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  45) set encoding=utf-8      " Default encoding
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  46) set noshowcmd
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  47) set clipboard=unnamed
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  48) set nomodeline
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  49) set modelines=0
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  50) set ttimeoutlen=0
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  51) set guicursor=          " Fallback to terminal's choice
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  52) set shortmess+=c        " don't give |ins-completion-menu| messages
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  53) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  54) " Ignore the following globs in file completions
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  55) set wildignore+=*.o,*.obj,*.pyc,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  56) set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  57) 
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  58) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  59) " Mappings {{{1
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  60) "
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  61) " vim does funny things with inline comments here, so don't use them.
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  62) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  63) " Silently open a shell in the directory of the current file
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  64) if has("win32") || has("win64")
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  65)   map ,s :silent !start cmd /k cd %:p:h <CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  66) endif
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  67) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  68) " Return to normal mode
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  69) inoremap jk <ESC>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  70) inoremap jj <ESC>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  71) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  72) " Move text on visual mode
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  73) vmap > >gv
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  74) vmap < <gv
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  75) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  76) " Cycle tab with recent buffer list
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  77) nmap <Tab> :bnext<CR>
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  78) nmap <S-Tab> :bprevious<CR>
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  79) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  80) " Always move between wrapped lines
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  81) nnoremap j gj
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  82) nnoremap k gk
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  83) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  84) " Move between splits with CTRL+[hjkl]
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  85) nnoremap <C-h> <C-w>h
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  86) nnoremap <C-j> <C-w>j
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  87) nnoremap <C-k> <C-w>k
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  88) nnoremap <C-l> <C-w>l
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  89) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  90) " Open terminal
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  91) nmap <leader>s <C-w>s<C-w>j:terminal<CR>
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  92) nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
c3fb70a5 (Hasan Mahmud      2020-02-28 12:15:32 +0600  93) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  94) " Leader keys {{{2
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  95) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  96) " Map leader (the dedicated user-mapping prefix key) to comma
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  97) let mapleader="\<Space>"
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  98) let maplocalleader = "\<Space>"
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600  99) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 100) " Leader + v to open vimrc in a new tab
a148397f (hasansujon786     2020-02-28 14:32:48 +0600 101) nmap <leader>dvim :tabedit $MYVIMRC<CR>
a148397f (hasansujon786     2020-02-28 14:32:48 +0600 102) nmap <leader>vim :tabedit ~/mydotfiles/nvim/init.vim<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 103) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 104) " OpeN a file (relative to the current file)
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 105) " See: http://vimcasts.org/episodes/the-edit-command/
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 106) " Synonyms: {e: edit, where: {w: window, s: split, v: vertical split, t: tab}}
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 107) cnoremap %% <C-R>=expand('%:h').'/'<cr>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 108) map <leader>ew :e %%
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 109) map <leader>es :sp %%
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 110) map <leader>ev :vsp %%
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 111) map <leader>et :tabe %%
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 112) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 113) " Disable search highlighting
61e5441a (hasansujon786     2020-02-28 14:07:17 +0600 114) nnoremap <C-l> :nohlsearch<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 115) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 116) " Create a directory relative to the current file
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 117) map <leader>d :!mkdir -p %%
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 118) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 119) " Write and build the current file
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 120) map <leader>m :write<CR> :make %<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 121) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 122) " Run the binary of the current file
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 123) map <leader>r :!./%:r<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 124) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 125) " UTC date
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 126) nmap <leader>t a<C-R>=strftime("%Y-%m-%d")<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 127) imap <leader>t <C-R>=strftime("%Y-%m-%d")<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 128) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 129) " pwgen
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 130) nmap <leader>p :read !pwgen -sy1 32<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 131) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 132) " Toggle highlighting of current line and column
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 133) nnoremap <leader>c :setlocal cursorline! cursorcolumn!<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 134) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 135) " Toggle spelling and show it's status
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 136) nmap <silent><leader>s :setlocal spell! spell?<CR>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 137) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 138) nmap <leader>q gqip
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 139) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 140) " Function keys {{{2
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 141) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 142) " Toggle paste mode (particularly useful to temporarily disable autoindent)
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 143) set pastetoggle=<F3>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 144) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 145) " Disabled keys {{{2
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 146) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 147) " Disable arrow keys (force good habits)
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 148) nnoremap <up> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 149) nnoremap <down> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 150) nnoremap <left> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 151) nnoremap <right> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 152) inoremap <up> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 153) inoremap <down> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 154) inoremap <left> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 155) inoremap <right> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 156) vnoremap <up> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 157) vnoremap <down> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 158) vnoremap <left> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 159) vnoremap <right> <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 160) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 161) " Disable help key
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 162) inoremap <F1> <ESC>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 163) nnoremap <F1> <ESC>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 164) vnoremap <F1> <ESC>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 165) 
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 166) " Disable Ex mode
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 167) nnoremap Q <nop>
33438952 (Hasan Mahmud      2020-02-28 13:12:22 +0600 168) 
