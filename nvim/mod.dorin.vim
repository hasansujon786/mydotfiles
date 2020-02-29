
" General settings {{{
 scriptencoding utf-16      " allow emojis in vimrc
 set nocompatible           " vim, not vi
 syntax on                  " syntax highlighting
 filetype plugin indent on  " try to recognize filetypes and load rel' plugins
" }}}
"
 "  Behavior Modification ----------------------  {{{
   set showcmd           " display incomplete commands
   set showcmd           " show any commands
   set autowrite         " Automatically :write before running commands
   set magic             " Use 'magic' patterns (extended regular expressions).
   set noshowmode        " don't show mode as airline already does
   set foldmethod=manual " set folds by syntax of current language
   set foldcolumn=2      " display gutter markings for folds
   set mouse=a           " enable mouse (selection, resizing windows)
   set iskeyword+=-      " treat dash separated words as a word text object
   set termguicolors     " enable true colors
   set hidden            " enable hidden unsaved buffers

   if !has('nvim')             " does not work on neovim
     set emoji                 " treat emojis 😄  as full width characters
     set cryptmethod=blowfish2 " set encryption to use blowfish2 (vim -x file.txt)
   end

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

   " set where swap file and undo/backup files are saved
     set backupdir=~/.vim/tmp,.
     set directory=~/.vim/tmp,.

   " persistent undo between file reloads
     if has('persistent_undo')
       set undofile
       set undodir=~/.vim/tmp,.
     endif

   " Open new split panes to right and bottom, which feels more natural
     set splitbelow
     set splitright

   " Set spellfile to location that is guaranteed to exist, canbe symlinked to
   " Dropbox or kept in Git
     set spellfile=$HOME/.vim-spell-en.utf-8.add

   " Autocomplete with dictionary words when spell check is on
     set complete+=kspell

   " Always use vertical diffs
     set diffopt+=vertical

   " enable folding in bash files
     let g:sh_fold_enabled=1
 " }}}
 "
" UI Customizations --------------------------------{{{
"
  " Make it obvious where 80 characters is
  " cheatsheet https://jonasjacek.github.io/colors/
  highlight ColorColumn ctermbg=236 guibg=#303030
  let &colorcolumn=join(range(80,999),',')
"  }}}


" Auto commands ------------------------------------------------- {{{
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


"  Key Mappings -------------------------------------------------- {{{

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

" Temporary {{{

" testing for bullets.vim
nnoremap <leader>m :vs test.md<cr>
nnoremap <leader>q :q!<cr>

"}}} 
