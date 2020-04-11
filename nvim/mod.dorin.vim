"
"   ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
"   ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
"  ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
"  ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
"  ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
"  ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
"     ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
"           ░    ░  ░    ░ ░        ░   ░         ░
"  Author: Hasan Mahmud
"  Repo  : https://github.com/hasansujon786/mydotfiles/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Sections:
"  -> Environment
"  -> General
"  -> Plugin-Settings
"  -> VIM-User-Interface
"  -> Colors-and-Fonts
"  -> Files-and-backups
"  -> Text-Tab-and-Indent
"  -> Spell-checking
"  -> Key-Mappings
"  -> Disabled-keys
"  -> Fold-related
"  -> Nvim-terminal
"  -> Abbreviations
"  -> Auto-commands
"  -> Helper-functions
"  -> Temporary
"  -> Misc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" => Environment ----------------------------------- {{{

" Local config
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif

" }}}

" => General --------------------------------------- {{{

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Automatically :write before running commands
set autowrite

" Some general settings
set magic             " For regular expressions turn magic on
set showcmd           " show any commands
set noshowmode        " don't show mode as airline already does
set path+=**          " usefull while using find in nested folders
set fillchars=""      " Remove characters in window split
set fillchars=stlnc:=
set nomodeline
set modelines=0
set ttimeoutlen=0
set shortmess+=c      " don't give |ins-completion-menu| messages
set lazyredraw        " Don't redraw while executing macros (good performance config)
set updatetime=100
" set clipboard=unnamed
" set clipboard+=unnamedplus

" Mouse Settings
if has('mouse')
  set mouse=a           " enable mouse (selection, resizing windows)
endif

" Map leader (the dedicated user-mapping prefix key) to space
let mapleader="\<Space>"
let maplocalleader="\<Space>"

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" }}}

" => Plugin-Settings ------------------------------- {{{

" Specify a directory for plugins
" For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.config/nvim/plugged')

" ======================================
" => Visual-&-Theme
" ======================================
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'rakr/vim-one'

" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'whatyouhide/vim-gotham'
" Plug 'ryanoasis/vim-devicons'

" ======================================
" => Functionality-&-Helpers
" ======================================
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/YankRing.vim', { 'on':  'YRShow' }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'   "for moving and manipulating files / directories.

" ======================================
" => Intrigration
" ======================================
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdtree'

" ======================================
" => Syntax
" ======================================
Plug 'sheerun/vim-polyglot'     " Full lang support
Plug 'ap/vim-css-color'

" ======================================
" => Git
" ======================================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" ======================================
" => Not-listed
" ======================================
" Plug 'terryma/vim-expand-region'
" Plug 'alvan/vim-closetag'
" Plug 'dragvisuals.vim'
" Plug 'vmath.vim'
" Plug 'vis.vim'

call plug#end()

" ======================================
" => junegunn/fzf
" ======================================
" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :History<CR>
nnoremap <silent> <leader>p :FZF -m<CR>
nnoremap <silent> <leader>m :Windows<CR>
" open FZF in current file's directory
nnoremap <silent> <Leader>_ :Files <C-R>=expand('%:h')<CR><CR>

let g:fzf_layout = { 'window': '8new' }
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit',
"   \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" \   + filter(copy(filter(v:oldfiles, "-1 != stridx(v:val, $PWD)")), "filereadable(fnamemodify(v:val, ':p'))"),
" let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always -E .git --ignore-file ~/.gitignore'
" let g:fzf_files_options = '--preview "(bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'
" let $FZF_DEFAULT_OPTS='--ansi --layout=reverse'
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" ======================================
" => Yggdroot/indentLine
" ======================================
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_color_gui = '#363949'
let g:indentLine_color_gui = '#444444'
let g:indentLine_char = '▏'

" ======================================
" => jiangmiao/auto-pairs
" ======================================
let g:AutoPairsShortcutJump = '<S-tab>'
let g:AutoPairsShortcutToggle = '<A-i>'

" ======================================
" => scrooloose/nerdtree
" ======================================
let g:NERDTreeIgnore = ['^node_modules$','^.git$']
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
" let NERDTreeMinimalMenu=1

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nnoremap <silent> <Leader>0 :NERDTreeToggle<CR>

" ======================================
" => Xuyuanp/nerdtree-git-plugin
" ======================================
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }

" ======================================
" => itchyny/lightline.vim
" ======================================
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \            [ 'gitbranch','readonly', 'filename', 'modified', ]],
      \
      \   'right':  [[ 'lineinfo' ],
      \              [ 'percent'  ],
      \              [ 'filetype' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineFugitive'
      \ },
      \ }
" let s:p.tabline.left   = [ [ s:gray1, s:bg ] ]
" let s:p.tabline.tabsel = [ [ s:fg, s:gray3, 'bold' ] ]
" nmap <leader>le :e ~/.config/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/one.vim

function! LightlineFugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? branch : ''
    " return branch !=# '' ? '# '.branch : ''
  endif
  return ''
endfunction

" ======================================
" => mhinz/vim-startify
" ======================================
let g:startify_files_number = 5

" ======================================
" => junegunn/goyo.vim
" ======================================
let g:background_before_goyo = &background

function! s:goyo_enter()
  let g:background_before_goyo = &background
  if has('gui_running')
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  execute 'set background=' . g:background_before_goyo
endfunction

augroup GOYO
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" ======================================
" => christoomey/vim-tmux-navigator
" ======================================
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
" nnoremap <silent> <S-tab> :TmuxNavigatePrevious<cr>

" ======================================
" => unblevable/quick-scope
" ======================================
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" let qs_max_chars=80
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='tomato' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#d78787' gui=underline ctermfg=81 cterm=underline
augroup END

" ======================================
" => vim-scripts/YankRing.vim
" ======================================
nnoremap <silent> <leader>yy :YRShow<CR>
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'

" ======================================
" => terryma/vim-multiple-cursors
" ======================================
" Default mappings
let g:multi_cursor_start_word_key      = 'gb'
let g:multi_cursor_select_all_word_key = '<C-F2>'
let g:multi_cursor_next_key            = 'gb'
let g:multi_cursor_prev_key            = 'gp'
let g:multi_cursor_quit_key            = 'q'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_skip_key            = '<C-x>'

" ======================================
" => mbbill/undotree
" ======================================
let g:undotree_WindowLayout = 2
let g:undotree_DiffAutoOpen = 0
" let g:undotree_DiffpanelHeight = 10
nnoremap <silent> <C-F5> :UndotreeToggle<cr>

" }}}

" => VIM-User-Interface ---------------------------- {{{

" Set 7 lines to the cursor - when moving vertically using j/k
set so=1

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set wildmenu          " Turn on the Wild menu
set pumblend=15       " set pum background visibility to 20 percent
set wildoptions=pum   " set file completion in command to use pum

" Ignore the following globs in file completions
set wildignore+=*.o,*~,*.pyc,*.obj,*.pyc,*.so,*.swp
set wildignore+=*.zip,*.jpg,*.gif,*.png,*.pdf
set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set hidden            " enable hidden unsaved buffers
set diffopt+=vertical " Always use vertical diffs
set splitbelow        " Open new split panes to bottom, which feels more natural
set splitright        " Open new split panes to right, which feels more natural
set ruler             "Always show current position
set cmdheight=1       " Height of the command bar
set foldcolumn=1      " display gutter markings for folds
set cursorline        " Show a line on current line

" Guicursor Setting
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Numbers
set number
set numberwidth=1
set relativenumber

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" }}}

" => Colors-and-Fonts ------------------------------ {{{

" Enable syntax highlighting
syntax on

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

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

try
  colorscheme one
catch
endtry

if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8    " Default encoding
scriptencoding utf-16 " allow emojis in vimrc

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Some default settings
" let g:one_allow_italics = 1       " support italic fonts
let g:sh_fold_enabled=1           " enable folding in bash files

" }}}

" => Files-backup-undo ----------------------------- {{{
"
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" set where swap file and undo/backup files are saved
" set backupdir=~/.config/nvim/tmp/backup,.
" set directory=~/.config/nvim/tmp/swap,.

" persistent undo between file reloads
if has('persistent_undo')
  " set undolevels=5000   " Save a lot of back-history...
  set undodir=~/.config/nvim/tmp/undo,.
  set undofile
endif

" File Browsing ----------------------------------
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=&spr       " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" }}}

" => Text-Tab-and-Indent --------------------------- {{{

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
set iskeyword+=-                    " treat dash separated words as a word text object
set textwidth=80                    " Hard-wrap text at nth column
set nowrap                          " nowrap by default
set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set list                            " show invisible characters
set matchpairs+=<:>,«:»,｢:｣         " Match angle brackets...
set ai "Auto indent
set si "Smart indent

" Highlight the characters on column 81
highlight ColorColumn guibg=magenta
call matchadd('ColorColumn', '\%81v', '100')

" }}}

" => Spell-checking -------------------------------- {{{

set spelllang=en_gb   " Speak proper English
set complete+=kspell  " Autocomplete with dictionary words when spell check is on

" Set spellfile to location that is guaranteed to exist
set spellfile=~/.config/nvim/spell/en.utf-8.add

" Toggle spelling and show it's status
nmap <F7> :setlocal spell! spell?<CR>

"Open spell file
map <leader>qe :tabnew ~/.config/nvim/spell/en.utf-8.add<Cr>

" Spell commands
" Next wrong spell      ]s
" Previous wrong spell  [s
" Add to spell file     zg
" Prompt spell fixes    z=

" }}}

" => Key-Mappings ---------------------------------- {{{

" Map q & jk to Esc key
nnoremap <silent> q <ESC>:noh<CR>
vnoremap <silent> q <ESC>
" Insert mode
inoremap jk <ESC>
inoremap qq <ESC>
cnoremap qq <C-c>

" Press Q to record a macro
nnoremap Q q

" j/k will move virtual lines (lines that wrap)
" Seamlessly treat visual lines as actual lines when moving around.
" Always move between wrapped lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Ensure Y works similar to D,C.
nmap Y y$

" Make vaa select the entire file...
xmap aa VGo1G

" Open vimrc in a new tab & source
nmap <leader>vid :tabedit $MYVIMRC<CR>
nmap <leader>vim :tabedit ~/mydotfiles/nvim/init.vim<CR>
nmap <leader>vis :source $MYVIMRC<CR>
" Fast editing and reloading of vimrc configs
" map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
" autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim

" Save file Quickly
nnoremap <C-s> :GitGutter<CR>:write<CR>
inoremap <C-s> <ESC>:GitGutter<CR>:write<CR>a
nnoremap <leader>s :GitGutter<CR>:write<CR>

" ======================================
" => Organize-files-&-folders
" ======================================

" Open a file relative to the current file
cnoremap $e <C-R>=expand('%:h').'/'<cr>
" Synonyms: e: edit,
" e: window, s: split, v: vertical split, t: tab, d: directory
map <Leader>er :Move <C-R>=expand("%")<CR>
map <leader>ed :Mkdir $e
map <leader>et :tabe $e
map <leader>ev :vsp $e
map <leader>es :sp $e
map <leader>ee :e $e

" change dir to current file's dir
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Find & open file on current window
"map <C-p> :tabfind *

" ======================================
" => Moving-around-tabs-and-buffers
" ======================================

" Prefix window control with space w
nnoremap <leader>w <C-w>
nnoremap <silent> + :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>

" zoom a vim pane, <C-w> = to re-balance
nnoremap <silent> \ :wincmd _<cr>:wincmd \|<cr>
nnoremap <silent> <Bar> :wincmd =<cr>

" Switch between the last two files
nnoremap <tab><tab> <c-^>

" " " Close the current buffer
" map <leader>bd :Bclose<cr>:tabclose<cr>gT
" " " Close all the buffers
" map <leader>ba :bufdo bd<cr>
" map <leader>l :bnext<cr>
" map <leader>h :bprevious<cr>
" map <leader>tm :tabmove
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

" ======================================
" => Modify-&-Rearrange-texts
" ======================================

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv
" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Move lines up and down in normal & visual mode
nmap <silent> <A-k> :move -2<CR>==
nmap <silent> <A-j> :move +1<CR>==
xnoremap <silent> <A-j> :move '>+1<CR>gv=gv
xnoremap <silent> <A-k> :move '<-2<CR>gv=gv


" ======================================
" => Search-functionalities
" ======================================

"TODO: Learn this shortcuts

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" vnoremap * "xy/<C-R>x<CR>

cnoremap *** %s/\<\>//ge<Left><Left><Left><Left><Left><Left>

" interactive find replace preview
set inccommand=nosplit
" replace word under cursor, globally, with confirmation
nnoremap <Leader>ff :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vnoremap <Leader>ff y :%s/<C-r>"//gc<Left><Left><Left>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
" xnoremap <Leader>r :s///g<Left><Left>
" xnoremap <Leader>rc :s///gc<Left><Left><Left>
" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
" nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
" xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" ======================================
" => Special-key-'g'-commands
" ======================================

" sort selected lines
vmap gs :sort<CR>

" Open a new tab
" nmap <silent> gh :tabprevious<CR>
" nmap <silent> gl :tabnext<CR>
" nmap <silent> gk :tabfirst<CR>
" nmap <silent> gj :tablast<CR>


" ======================================
" => Insert-Mode-key-mapping
" ======================================

" move cursor on insert mode
inoremap <A-k> <up>
inoremap <A-j> <Down>
inoremap <A-l> <Right>
inoremap <A-h> <Left>

" Delete previous word
inoremap <A-BS> <c-w>

" Make a new line under the cursor
inoremap <silent> <A-CR> <Esc>mqA<CR><Esc>`qa

" Auto complete file path
inoremap <c-f> <c-x><c-f>

" Autocomplete with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" last typed word to lower case
" inoremap <C-w>u <esc>guawA
" last typed word to UPPER CASE
" inoremap <C-w>U <esc>gUawA
" Entire Line To Lower Case
" inoremap <C-g>u <esc>guuA
" Entire Line To Upper Case
" inoremap <C-g>U <esc>gUUA
" Last Word To Title Caseu
" inoremap <C-w>t <esc>bvgU<esc>A
" Current Line To Title Case
" inoremap <C-g>t <esc>:s/\v<(.)(\w*)/\u\1\L\2/g<cr>:noh<cr>A

" ======================================
" => Command-mode-related
" ======================================

" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" ======================================
" => underscore-commands
" ======================================
" Compile & Run C code
nnoremap _bb :w<CR>:!gcc % -o .lastbuild && ./.lastbuild<cr>
nnoremap _b :w<CR>:!./.lastbuild<cr>

" Prettier:
" shows the output from prettier - useful for syntax errors
nnoremap _bt :!prettier %<CR>

" Toggle highlighting of current line and column
nnoremap <silent> _c :setlocal cursorcolumn!<CR>

" Toggle relative line numbers and regular line numbers.
nnoremap <silent> _nn :set invrelativenumber<CR>
nnoremap <silent> _n :set nu!<CR>

" Trim Whitespaces
nnoremap <silent> _tt :call TrimWhitespace()<CR>

" Index ctags from any project, including those outside Rails
nnoremap _tag :!ctags -R .<CR>

" Allow j and k to work on visual lines (when wrapping)
noremap <silent> _wp :call ToggleWrap()<CR>

" Toggle Goyo
nnoremap <silent> __ :Goyo<CR>

" Silently open a shell in the directory of the current file
if has("win32") || has("win64")
  map _s :silent !start cmd /k cd %:p:h <CR>
endif

" ======================================
" => Function-key-mappings
" ======================================

" re-indent file and jump back to where the cursor was
map <F6> mzgg=G`z

" Pasting support
set pastetoggle=<F3>  " Press F3 in insert mode to preserve tabs when
" pasting from clipboard into terminal

" toggle background light / dark
nnoremap <silent> <F10> :call ToggleBackground()<CR>

" }}}

" => Disabled-keys --------------------------------- {{{

" disable arrow keys in normal mode
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Disable help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" }}}

" => Fold-related ---------------------------------- {{{

" Space to toggle folds.
nnoremap <leader>z za
vnoremap <leader>z za

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" autocmd FileType vim setlocal fdc=1
set foldlevel=99

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


" }}}

" => Nvim-terminal --------------------------------- {{{

" TODO:

" Default settings
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufEnter term://* startinsert
autocmd TermOpen * set bufhidden=hide

" Terminal mappings -------------------------------

tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
tmap <C-d> <Esc>:q<CR>

" Open terminal
nmap <leader>ts <C-w>s<C-w>j:terminal<CR>
nmap <leader>tv <C-w>v<C-w>l:terminal<CR>

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
"
" Navigate neovim + neovim terminal emulator with alt+direction
tnoremap <silent><C-h> <C-\><C-n><C-w>h
tnoremap <silent><C-j> <C-\><C-n><C-w>j
tnoremap <silent><C-k> <C-\><C-n><C-w>k
tnoremap <silent><C-l> <C-\><C-n><C-w>l

" }}}

" => Abbreviations --------------------------------- {{{

iab vsbst Nvim is best
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
" UTC date
" nmap <leader>date a<C-R>=strftime("%d-%m-%Y")<CR>
" imap <leader>t <C-R>=strftime("%Y-%m-%d")<CR>

" }}}

" => Auto-commands --------------------------------- {{{
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

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Only show the cursor line in the active buffer.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" }}}

" => Helper-functions ------------------------------ {{{

function! ToggleWrap()
  if &wrap
    echo 'Wrap OFF'
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> j
    silent! nunmap <buffer> k
  else
    " TODO: fix jk mapping while wrap toggle
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

fun! ToggleBackground()
  if (&background ==? 'dark')
    set background=light
  else
    set background=dark
  endif
endfun

function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction
autocmd BufWritePre * :call TrimWhitespace()

" PlaceholderImgTag 300x200
function! s:PlaceholderImgTag(size)
  let url = 'http://dummyimage.com/' . a:size . '/000000/555555'
  let [width,height] = split(a:size, 'x')
  execute "normal a<img src=\"".url."\" width=\"".width."\" height=\"".height."\" />"
endfunction
command! -nargs=1 PlaceholderImgTag call s:PlaceholderImgTag(<f-args>)

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" }}}

" => Temporary ------------------------------------- {{{

" if !empty(glob("~/mydotfiles/nvim/init.vim"))
"   source ~/mydotfiles/nvim/init.vim
"   echo 'Welcom to Neovim'
" endif

" " javascript {{{
"   Plug 'nvim-typescript'
"   Plug 'othree/yajs.vim'
"   Plug 'mxw/vim-jsx'
"   Plug 'heavenshell/vim-jsdoc'
"   Plug 'elzr/vim-json'
"   Plug 'HerringtonDarkholme/yats.vim'
"   Plug 'Quramy/vison'
"   Plug 'jxnblk/vim-mdx-js'
"   Plug 'meain/vim-package-info', {'build': 'npm install'}
"   Plug 'yardnsm/vim-import-cost', {'build': 'npm install'}
" " }}}
" " html {{{
"   Plug 'othree/html5.vim'
"   Plug 'mattn/emmet-vim'
"   Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
"   Plug 'posva/vim-vue'
"   Plug 'skwp/vim-html-escape'
"   Plug 'kana/vim-textobj-user'
"   Plug 'whatyouhide/vim-textobj-xmlattr'
"   Plug 'pedrohdz/vim-yaml-folds'
" " }}}
" " css {{{
"   Plug 'hail2u/vim-css3-syntax'
"   Plug 'ap/vim-css-color'
"   Plug 'norcalli/nvim-colorizer.lua'
"   Plug 'ncm2/ncm2-cssomni'
" " }}}

"set foldmethod=manual " set folds by syntax of current language
" fold file based on syntax
"nnoremap <silent> <leader>zs :setlocal foldmethod=syntax<CR>

" Write and build the current file
" map <leader>m :write<CR> :make %<CR>
" Run the binary of the current file
" map <leader>r :!./%:r<CR>
" pwgen
" nmap <leader>pg :read !pwgen -sy1 32<CR>
" nmap <leader>q gqip

" temporary Map Function keys --------------------

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

" Insert cut marks...
" nmap -- A<CR><CR><CR><ESC>k6i-----cut-----<ESC><CR>

" Automatically fix the last misspelled word and jump back to where you were.
"   Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
" nnoremap <leader>sp :normal! mz[s1z=`z<CR>


" }}}

" => Misc ------------------------------------------ {{{

" ======================================
" => Omni complete functions
" ======================================
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
" map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>

" }}}

" => Section name ---------------------------------- {{{
" }}}

" ======================================
" => Title
" ======================================
