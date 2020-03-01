" Environment ----------------------------------- {{{
" A consistent runtime environment.

  " Manually load vim-sensible so we can override its settings later
  " runtime bundle/vim-sensible/plugin/sensible.vim

    set spellfile=$XDG_CONFIG_HOME/nvim/spell/en.utf-8.add
    set backupdir=$XDG_CONFIG_HOME/nvim/tmp,.
    set directory=$XDG_CONFIG_HOME/nvim/tmp,.

  " set where swap file and undo/backup files are saved
    set backupdir=~/.vim/tmp,.
    set directory=~/.vim/tmp,.

  " persistent undo between file reloads
    if has('persistent_undo')
    set undofile
    set undodir=~/.vim/tmp,.
    endif

  " Set spellfile to location that is guaranteed to exist, canbe symlinked to
  " Dropbox or kept in Git
    set spellfile=$HOME/.vim-spell-en.utf-8.add

" }}}


" General settings ------------------------------ {{{
    scriptencoding utf-16      " allow emojis in vimrc
    set nocompatible           " forget about vi and set it first as it modifies future behaviour
    syntax on                  " syntax highlighting
    filetype plugin indent on  " try to recognize filetypes and load rel' plugins

    set path+=**               " usefull while using find in nested folders
    set wildmenu
" }}}


"  Behavior Modification ------------------------ {{{
    set showcmd           " show any commands
    set autowrite         " Automatically :write before running commands
    set magic             " Use 'magic' patterns (extended regular expressions).
    set noshowmode        " don't show mode as airline already does
    set mouse=a           " enable mouse (selection, resizing windows)
    set iskeyword+=-      " treat dash separated words as a word text object
    set termguicolors     " enable true colors
    set hidden            " enable hidden unsaved buffers

    set spelllang=en_gb   " Speak proper English
    set complete+=kspell  " Autocomplete with dictionary words when spell check is on
    set fillchars=""      " Remove characters in window split
    set encoding=utf-8    " Default encoding
    set showmode          " Persistent notice of current mode
    set clipboard=unnamed
    set nomodeline
    set modelines=0
    set ttimeoutlen=0
    set shortmess+=c      " don't give |ins-completion-menu| messages
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

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

  " Wrapping
    set textwidth=80        " Hard-wrap text at nth column
    set nowrap              " Don't wrap long lines (good for vsplits)

    if !has('nvim')             " does not work on neovim
      set emoji                 " treat emojis 😄  as full width characters
      set cryptmethod=blowfish2 " set encryption to use blowfish2 (vim -x file.txt)
    endif

  " visual bell for errors
    set visualbell

  " text appearance
    set textwidth=80
    set nowrap                          " nowrap by default
    set list                            " show invisible characters
    set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

  " Numbers
    set number
    set numberwidth=1
    set relativenumber 

  " Visuals
    set termguicolors
    set background=dark
    let g:one_allow_italics = 1

  " Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

  " Always use vertical diffs
    set diffopt+=vertical

  " enable folding in bash files
    let g:sh_fold_enabled=1
" }}}
 

" UI Customizations ----------------------------- {{{
  " Make it obvious where 80 characters is
  " cheatsheet https://jonasjacek.github.io/colors/
  "highlight ColorColumn ctermbg=236 guibg=#303030
  "let &colorcolumn=join(range(80,999),',')
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


" Key Mappings --------------------------------- {{{
"
  " Silently open a shell in the directory of the current file
    if has("win32") || has("win64")
      map ,s :silent !start cmd /k cd %:p:h <CR>
    endif

  " Return to normal mode
    inoremap jk <ESC>
    inoremap jj <ESC>

  " Always move between wrapped lines
    nnoremap j gj
    nnoremap k gk

  " Move text on visual mode
    vmap > >gv
    vmap < <gv

  " Cycle tab with recent buffer list
    nmap <Tab> :bnext<CR>
    nmap <S-Tab> :bprevious<CR>

  " Open a new tab
    nmap go :tabnew<CR>
  " Open file on current window
    map <C-p> :find *

  " Move between splits with CTRL+[hjkl]
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

  " Map leader (the dedicated user-mapping prefix key) to space
    let mapleader="\<Space>"
    let maplocalleader = "\<Space>"

  " Prefix window management with space w
    map <leader>w <C-w>

  " Open vimrc in a new tab
    nmap <leader>vid :tabedit $MYVIMRC<CR>
    nmap <leader>vim :tabedit ~/mydotfiles/nvim/init.vim<CR>
    nmap <leader>vis :source $MYVIMRC<CR>

  " Disable search highlighting
    nmap <silent> <leader><leader> :noh<CR>

  " Neovim :Terminal
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    tmap <Esc> <C-\><C-n>
    tmap <C-w> <Esc><C-w>
    "tmap <C-d> <Esc>:q<CR>
    "
  " Open terminal
    nmap <leader>ts <C-w>s<C-w>j:terminal<CR>
    nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

  " Create a directory relative to the current file
    map <leader>d :!mkdir -p %%

  " UTC date
    nmap <leader>pd a<C-R>=strftime("%Y-%m-%d")<CR>
    "imap <leader>t <C-R>=strftime("%Y-%m-%d")<CR>

  " Toggle highlighting of current line and column
    nnoremap <leader>c :setlocal cursorline! cursorcolumn!<CR>

  " Toggle spelling and show it's status
    nmap <silent><leader>s :setlocal spell! spell?<CR>

  " Toggle number
    nmap  <leader>n :set relativenumber! number!<CR>

  " TODO: not yet learned this mappings
  
  " fold file based on syntax
    nnoremap <silent> <leader>zs :setlocal foldmethod=syntax<CR>

  " rename current file
    nnoremap <Leader>rn :Move <C-R>=expand("%")<CR>

  " replace word under cursor, globally, with confirmation
    nnoremap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
    vnoremap <Leader>k y :%s/<C-r>"//gc<Left><Left><Left>
  " interactive find replace preview
    set inccommand=nosplit

  " sort selected lines
    vmap gs :sort<CR>

  " Pasting support
    set pastetoggle=<F2>  " Press F2 in insert mode to preserve tabs when
    map <F10> :set paste<CR>
    map <F11> :set nopaste<CR>
    imap <F10> <C-O>:set paste<CR>
    imap <F11> <nop>
    set pastetoggle=<F11>

  " Allow j and k to work on visual lines (when wrapping)
    noremap <silent> <Leader>w :call ToggleWrap()<CR>
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
        noremap  <buffer> <silent> k   gk
        noremap  <buffer> <silent> j gj
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
      endif
    endfunction

  " Tab/shift-tab to indent/outdent in visual mode.
    vnoremap <Tab> >gv
    vnoremap <S-Tab> <gv
  " Keep selection when indenting/outdenting.
    vnoremap > >gv
    vnoremap < <gv

  " Search for selected text
    vnoremap * "xy/<C-R>x<CR>

  " toggle background light / dark
    fun! ToggleBackground()
      if (&background ==? 'dark')
        set background=light
      else
        set background=dark
      endif
    endfun

    nnoremap <silent> <F10> :call ToggleBackground()<CR>

  " change dir to current file's dir
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

  " zoom a vim pane, <C-w> = to re-balance
    nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
    nnoremap <leader>= :wincmd =<cr>

  " Index ctags from any project, including those outside Rails
    map <Leader>ct :!ctags -R .<CR>

  " Switch between the last two files
    nnoremap <tab><tab> <c-^>

  " copy to end of line
    nnoremap Y y$

  " copy to system clipboard
    noremap gy "+y

  " copy whole file to system clipboard
    nnoremap gY gg"+yG

  " Prettier:
    " shows the output from prettier - useful for syntax errors
    nnoremap <leader>pt :!prettier %<CR>

  " disable arrow keys in normal mode
    nnoremap <Left> :echoe "Use h"<CR>
    nnoremap <Right> :echoe "Use l"<CR>
    nnoremap <Up> :echoe "Use k"<CR>
    nnoremap <Down> :echoe "Use j"<CR>

  " last typed word to lower case
    inoremap <C-w>u <esc>guawA

  " last typed word to UPPER CASE
    inoremap <C-w>U <esc>gUawA

  " entire line to lower case
    inoremap <C-g>u <esc>guuA

  " entire line to UPPER CASE
    inoremap <C-g>U <esc>gUUA

  " last word to title case
    inoremap <C-w>t <esc>bvgU<esc>A

  " current line to title case
    inoremap <C-g>t <esc>:s/\v<(.)(\w*)/\u\1\L\2/g<cr>A

  " Open files relative to current path:
    nnoremap <leader>ed :edit <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>sp :split <C-R>=expand("%:p:h") . "/" <CR>
    nnoremap <leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>

  " move lines up and down in visual mode
    xnoremap <c-k> :move '<-2<CR>gv=gv
    xnoremap <c-j> :move '>+1<CR>gv=gv
  "Abbreviations
    iab ms Microsoft

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif

  " set pum background visibility to 20 percent
    set pumblend=20

  " set file completion in command to use pum
    set wildoptions=pum

  " Navigate neovim + neovim terminal emulator with alt+direction
    tnoremap <silent><C-h> <C-\><C-n><C-w>h
    tnoremap <silent><C-j> <C-\><C-n><C-w>j
    tnoremap <silent><C-k> <C-\><C-n><C-w>k
    tnoremap <silent><C-l> <C-\><C-n><C-w>l

  " easily escape terminal
    tnoremap <leader><esc> <C-\><C-n><esc><cr>
    tnoremap <C-o> <C-\><C-n><esc><cr>

  " quickly toggle term
    nnoremap <silent> <leader>o :vertical botright Ttoggle<cr><C-w>l
    nnoremap <silent> <leader>O :botright Ttoggle<cr><C-w>j
    nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l

    " close terminal
    tnoremap <silent> <leader>o <C-\><C-n>:Ttoggle<cr>
    tnoremap <silent> <leader><space> <C-\><C-n>:Ttoggle<cr>

  " Map Function keys
  " Toggle paste mode (particularly useful to temporarily disable autoindent)
    set pastetoggle=<F3>
" }}}


" Disabled keys --------------------------------- {{{

  " Disable arrow keys (force good habits)
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
    vnoremap <up> <nop>
    vnoremap <down> <nop>
    vnoremap <left> <nop>
    vnoremap <right> <nop>

  " Disable help key
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>

  " Disable Ex mode
    nnoremap Q <nop>
" }}}


" Temporary ------------------------------------- {{{
   "set foldmethod=manual " set folds by syntax of current language
   "set foldcolumn=2      " display gutter markings for folds

  " testing for bullets.vim
  nnoremap <leader>m :vs test.md<cr>
  nnoremap <leader>q :q!<cr>
  "
  " Open a file (relative to the current file)
  " See: http://vimcasts.org/episodes/the-edit-command/
  " Synonyms: {e: edit, where: {w: window, s: split, v: vertical split, t: tab}}
  cnoremap %% <C-R>=expand('%:h').'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

  " Write and build the current file
  map <leader>m :write<CR> :make %<CR>
  " Run the binary of the current file
  map <leader>r :!./%:r<CR>
  " pwgen
  nmap <leader>pg :read !pwgen -sy1 32<CR>
  nmap <leader>q gqip
" }}} 
"
"if !empty(glob("~/mydotfiles/nvim/init.vim"))
  "source ~/mydotfiles/nvim/init.vim
  "echo 'Welcom to Neovim'
"endif
echo "Welcome to Neovim"
