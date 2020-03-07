"  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
"  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
" ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
" ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
" ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
" ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
"    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
"          ░    ░  ░    ░ ░        ░   ░         ░
"
"     - Hasan's NeoVim Configuration 01.03.2020 -
"
" Environment ----------------------------------- {{{
" A consistent runtime environment...

" set where swap file and undo/backup files are saved
set backupdir=~/.config/nvim/tmp,.
set directory=~/.config/nvim/tmp,.

" persistent undo between file reloads
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp,.
endif

" Set spellfile to location that is guaranteed to exist
set spellfile=~/.config/nvim/spell/en.utf-8.add

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif

if !has('nvim')             " does not work on neovim
  set cryptmethod=blowfish2 " set encryption to use blowfish2 (vim -x file.txt)
  set emoji                 " treat emojis 😄  as full width characters
endif
" }}}


" Plugin Settings ------------------------------- {{{

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.vim/plugged')

"" Utils
Plug 'kien/ctrlp.vim'

"" Visual
Plug 'whatyouhide/vim-gotham'
Plug 'rakr/vim-one'
"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'joshdick/onedark.vim'

" On-demand loading
"
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }


" Initialize plugin system
call plug#end()

" }}}


" General settings ------------------------------ {{{
scriptencoding utf-16      " allow emojis in vimrc
set nocompatible           " forget about vi and set it first as it modifies future behaviour
syntax on                  " syntax highlighting
filetype plugin indent on  " try to recognize filetypes and load rel' plugins
" }}}


" Behavior Modification ------------------------- {{{
set showcmd           " show any commands
set autowrite         " Automatically :write before running commands
set magic             " Use 'magic' patterns (extended regular expressions).
set noshowmode        " don't show mode as airline already does
set mouse=a           " enable mouse (selection, resizing windows)
set iskeyword+=-      " treat dash separated words as a word text object
set hidden            " enable hidden unsaved buffers
set diffopt+=vertical " Always use vertical diffs
set pumblend=15       " set pum background visibility to 20 percent
set splitbelow        " Open new split panes to bottom, which feels more natural
set splitright        " Open new split panes to right, which feels more natural 
set visualbell        " visual bell for errors
set wildoptions=pum   " set file completion in command to use pum
set wildmenu

set path+=**          " usefull while using find in nested folders
set spelllang=en_gb   " Speak proper English
set complete+=kspell  " Autocomplete with dictionary words when spell check is on
set fillchars=""      " Remove characters in window split
set encoding=utf-8    " Default encoding
set showmode          " Persistent notice of current mode
set clipboard+=unnamedplus
set nomodeline
set modelines=0
set ttimeoutlen=0
set shortmess+=c      " don't give |ins-completion-menu| messages
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175
set cursorline

" Ignore the following globs in file completions
set wildignore+=*.o,*.obj,*.pyc,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf
set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules

" Tabbing
set tabstop=2           " The number of spaces a tab is
set shiftwidth=2        " Number of spaces to use in auto(indent)
set softtabstop=2       " Just to be clear
set expandtab           " Insert tabs as spaces

" Searching
set wrapscan            " Wrap searches
set ignorecase          " Ignore search term case...
set smartcase           " ... unless term contains an uppercase character
set hlsearch            " ... as you type

" text appearance
set textwidth=80                    " Hard-wrap text at nth column
set nowrap                          " nowrap by default
set list                            " show invisible characters
set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

" Numbers
set number
set numberwidth=1
set relativenumber

" Visuals
colorscheme one
set background=dark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"copy next line to .tmux.conf for support true color within tmux
"set-option -ga terminal-overrides ",xterm-256color:Tc"
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

let g:one_allow_italics = 1 " support italic fonts
let g:sh_fold_enabled=1 " enable folding in bash files
" }}}


" UI Customizations ----------------------------- {{{
" Make it obvious where 80 characters is
" cheatsheet https://jonasjacek.github.io/colors/
"highlight ColorColumn ctermbg=236 guibg=#303030
"let &colorcolumn=join(range(80,999),',')

" File Browsing --------------------------------
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=&spr       " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" }}}


" Key Mappings ---------------------------------- {{{

" map qq to Esc key
"nnoremap q <nop>
vnoremap q <nop>
nnoremap qq <Esc>
vnoremap qq <Esc>
cnoremap qq <ESC>
inoremap qq <ESC>
inoremap jk <ESC>

nmap <C-F5> :!gcc % -o .lastbuild && ./.lastbuild<cr>

" Map leader (the dedicated user-mapping prefix key) to space
let mapleader="\<Space>"
let maplocalleader = "\<Space>"

" Silently open a shell in the directory of the current file
if has("win32") || has("win64")
  map ,s :silent !start cmd /k cd %:p:h <CR>
endif

" Always move between wrapped lines
nnoremap j gj
nnoremap k gk

" Open vimrc in a new tab & source
nmap <leader>vid :tabedit $MYVIMRC<CR>
nmap <leader>vim :tabedit ~/mydotfiles/nvim/init.vim<CR>
nmap <leader>vis :source $MYVIMRC<CR>

" Disable search highlighting
nmap <silent> <C-l> :noh<CR>

" UTC date
nmap <leader>pd a<C-R>=strftime("%Y-%m-%d")<CR>
"imap <leader>t <C-R>=strftime("%Y-%m-%d")<CR>

" Organize files & folders -----------------------

" Open a file relative to the current file
" See: http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>
cnoremap ++ <C-R>=expand("%:p:h") . "/"<CR>
" Synonyms: {e: edit, where: {w: window, s: split, v: vertical split, t: tab}}
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Find & open file on current window
"map <C-p> :tabfind *

" Create a directory relative to the current file
nnoremap <leader>d :!mkdir -p %%
" rename current file
nnoremap <Leader>rn :Move <C-R>=expand("%")<CR>
" change dir to current file's dir
nnoremap <leader>dc :cd %:p:h<CR>:pwd<CR>


" Window control --------------------------------

" Prefix window control with space w
map <leader>w <C-w>

" Move between splits with leader+[hjkl]
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" zoom a vim pane, <C-w> = to re-balance
nnoremap <silent> ,, :wincmd _<cr>:wincmd \|<cr>
nnoremap <silent> ,. :wincmd =<cr>

" Switch between the last two files
nnoremap <tab><tab> <c-^>

" Cycle tab with recent buffer list
"nmap <Tab> :bnext<CR>
"nmap <S-Tab> :bprevious<CR>

" Tab control ------------------------------------

" Open a new tab
nmap gh :tabfirst<CR>
nmap gl :tablast<CR>

" Modify & Rearrange texts -----------------------

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv
" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move lines up and down in normal & visual mode
nmap <silent> <A-j> :move +1<CR>==
nmap <silent> <A-k> :move -2<CR>==
xnoremap <silent> <A-j> :move '>+1<CR>gv=gv
xnoremap <silent> <A-k> :move '<-2<CR>gv=gv

" replace word under cursor, globally, with confirmation
nnoremap <Leader>f :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vnoremap <Leader>f y :%s/<C-r>"//gc<Left><Left><Left>
" interactive find replace preview
set inccommand=nosplit

" Search for selected text
vnoremap * "xy/<C-R>x<CR>

cnoremap *** %s/\<\>//ge<Left><Left><Left><Left><Left><Left>

" Index ctags from any project, including those outside Rails
map <Leader>uct :!ctags -R .<CR>

" Prettier:
" shows the output from prettier - useful for syntax errors
nnoremap <leader>pt :!prettier %<CR>


" Special key 'g' commands ------------------------

" sort selected lines
vmap gs :sort<CR>



" Insert Mode key mapping -----------------------
" Auto complete file path
inoremap <c-f> <c-x><c-f>

" last typed word to lower case
inoremap <C-w>u <esc>guawA
" last typed word to UPPER CASE
inoremap <C-w>U <esc>gUawA
" Entire Line To Lower Case
inoremap <C-g>u <esc>guuA
" Entire Line To Upper Case
inoremap <C-g>U <esc>gUUA
" Last Word To Title Caseu
inoremap <C-w>t <esc>bvgU<esc>A
" Current Line To Title Case
inoremap <C-g>t <esc>:s/\v<(.)(\w*)/\u\1\L\2/g<cr>:noh<cr>A
" }}}


" Toggle supports ------------------------------- {{{

" Toggle highlighting of current line and column
nnoremap <leader>c :setlocal cursorcolumn!<CR>

" Toggle spelling and show it's status
nmap <silent><leader>s :setlocal spell! spell?<CR>

" Toggle number
nmap  <leader>n :set relativenumber! number!<CR>

" Allow j and k to work on visual lines (when wrapping)
noremap <Leader>wr :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo 'Wrap OFF'
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> j
    silent! nunmap <buffer> k
  else
    echo 'Wrap ON'
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    inoremap <buffer> <silent> <Up> <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
  endif
endfunction

" toggle background light / dark
fun! ToggleBackground()
  if (&background ==? 'dark')
    set background=light
  else
    set background=dark
  endif
endfun
nnoremap <silent> <F10> :call ToggleBackground()<CR>
" }}}


" Disabled keys --------------------------------- {{{


" disable arrow keys in normal mode
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Disable Ex mode
nnoremap Q <nop>
" }}}


" Fold, gets it's own section ------------------- {{{

function! MyFoldText() " {{{
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
  " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines   ')
  let fillcharcount = windowwidth - len(line)
  " return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines'
  return line . ''. repeat(" ",fillcharcount)
endfunction " }}}

set foldtext=MyFoldText()

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" autocmd FileType vim setlocal fdc=1
set foldlevel=99

" Space to toggle folds.
nnoremap <leader>z za
vnoremap <leader>z za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType coffee setl foldmethod=indent
let g:xml_syntax_folding = 1
autocmd FileType xml setl foldmethod=syntax

autocmd FileType html setl foldmethod=expr
autocmd FileType html setl foldexpr=HTMLFolds()

" autocmd FileType javascript,typescript,json setl foldmethod=syntax
autocmd FileType javascript,typescript,typescript.tsx,typescriptreact,json setl foldmethod=syntax

" }}}


" Nvim terminal --------------------------------- {{{

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufEnter term://* startinsert
autocmd TermOpen * set bufhidden=hide

" Terminal mappings -------------------------------
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
" Open terminal
nmap <leader>ts <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
" easily escape terminal
tnoremap <leader><esc> <C-\><C-n><esc><cr>
tnoremap <C-o> <C-\><C-n><esc><cr>
" close terminal
tnoremap <silent> <leader>o <C-\><C-n>:Ttoggle<cr>
tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>
" quickly toggle term
"nnoremap <silent> <leader>o :vertical botright Ttoggle<cr><C-w>l
"nnoremap <silent> <leader>O :botright Ttoggle<cr><C-w>j
"nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l
" Navigate neovim + neovim terminal emulator with alt+direction
tnoremap <silent><C-h> <C-\><C-n><C-w>h
tnoremap <silent><C-j> <C-\><C-n><C-w>j
tnoremap <silent><C-k> <C-\><C-n><C-w>k
tnoremap <silent><C-l> <C-\><C-n><C-w>l
" }}}


" Abbreviations --------------------------------- {{{
iab vsbst Nvim is best

" }}}


" Snippets -------------------------------------- {{{
nnoremap ,html :-1read ~/mydotfiles/nvim/.skeleton.html<CR>3jwf>a

" }}}


" Auto commands --------------------------------- {{{
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals,*.rabl set filetype=ruby
  autocmd BufRead,BufNewFile .babelrc set filetype=json
  autocmd BufRead,BufNewFile *.yrl set filetype=erlang
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .eslintrc,.prettierrc set filetype=json

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Vim/tmux layout rebalancing
  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =

  " add support for comments in json (jsonc format used as configuration for
  " many utilities)
  autocmd FileType json syntax match Comment +\/\/.\+$+

augroup END
" }}}


" Section name ---------------------------------- {{{
" }}}
"if !empty(glob("~/mydotfiles/nvim/init.vim"))
"source ~/mydotfiles/nvim/init.vim
"echo 'Welcom to Neovim'
"endif
echo "Welcome to Neovim"


" Temporary ------------------------------------- {{{
"set foldmethod=manual " set folds by syntax of current language
"set foldcolumn=2      " display gutter markings for folds
" fold file based on syntax
"nnoremap <silent> <leader>zs :setlocal foldmethod=syntax<CR>

" Write and build the current file
"map <leader>m :write<CR> :make %<CR>
" Run the binary of the current file
"map <leader>r :!./%:r<CR>
" pwgen
"nmap <leader>pg :read !pwgen -sy1 32<CR>
"nmap <leader>q gqip

" temporary Map Function keys

" Toggle paste mode (particularly useful to temporarily disable autoindent)
"set pastetoggle=<F3>

" Pasting support
"set pastetoggle=<F2>  " Press F2 in insert mode to preserve tabs when
"map <F10> :set paste<CR>
"map <F11> :set nopaste<CR>
"imap <F10> <C-O>:set paste<CR>
"imap <F11> <nop>
"set pastetoggle=<F11>

" Copy to osx clipboard
"vnoremap <C-c> "*y<CR>
"vnoremap y "*y<CR>
" Delete to untilled register
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d
" copy to end of line
"nnoremap Y y$
" copy to system clipboard
"noremap gy "+y
" copy whole file to system clipboard
"nnoremap gY gg"+yG
" }}}


