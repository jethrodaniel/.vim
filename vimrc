"
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

"------------------------------------------
" General settings
"------------------------------------------

" This is vim, not vi
set nocompatible

" Vim needs a more POSIX-compliant shell than fish
" See <https://github.com/dag/vim-fish>
if &shell =~# 'fish$'
  set shell=/usr/bin/env bash
endif

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show the cursor position in the bottom right-corner as >
"   row,column
" <
set ruler

" Show the current command being typed
set showcmd

" Show line numbers, relative to the source file
set number

" Show sign column all the time, even if there aren't any diffs.
"
" This is being used to display git status in the 'gutter` using
" https://github.com/mhinz/vim-signify
set signcolumn=yes

" Limit number of diffs to search for when displaying the gutter
let g:signify_vcs_list=['git']

" Show more of the file path in the status line
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Add spaces when indenting
set autoindent

" Don't show vim intro screen
set shortmess+=I

" Make `diffthis` use vertical windows by default
set diffopt+=vertical

" American English
setlocal spelllang=en_us

" Words added with `zg`
set spellfile=~/.vim/spell/en.utf-8.add

set backup    " Keep a backup file (restore to previous version)
set undofile  " Keep an undo file (undo changes after closing)

" Put backups in a single place, also enables persistent undo
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set tabstop=2     " Tabs are length 2, globally
set shiftwidth=2  " Insert 2 spaces for indentation
set expandtab     " Use spaces instead of tabs

set nowrap " Do not automatically wrap on load

" Open new horizontal splits at the bottom of the current window
set splitbelow

" Open new vertical splits to the right of the current window
set splitright

" Show a minimum number of lines below and above the current line
set scrolloff=3

" Add vim-fugitive status line:
"
" From `:help :Gbrowse`: >
"   If you don't have a statusline, this one matches the default when 'ruler'
"   is set:
" <
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" Use incremental searching, i.e, highlight searching while typing
set incsearch

set ignorecase  " Case insensitive search for small caps
set smartcase   " ... unless the search contains at least one capital
set wrapscan    " Enable searching around the end of a file

" Enchances % with keyword pairs
" For example, ruby's do..end pairs
runtime! macros/matchit.vim

" Disable the mouse.
"
" This is useful for laptops, where the trackpad gets brushed occasionally.
"
" If you *wanted* mouse support, use this >
"   if has('mouse')
"     set mouse=a
"   endif
" <
set mouse=

" If compiled with support for autocommands
if has('autocmd')

  " Only highlight while searching
  augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
  augroup END

  " When editing a file, always jump to the last known cursor position
  augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END

  " Set filetype specific options
  augroup indentation_and_options
    autocmd!
    autocmd! FileType make      setlocal noexpandtab

    " Always spell-check commits and add rulers for correct length
    autocmd Filetype gitcommit setlocal spell textwidth=72 colorcolumn=73 colorcolumn+=51

    " Indent xml files with gg=G
    " From <https://stackoverflow.com/a/21408619/7132678>
    " Note: xmllint is needed ,for example with `brew install xmlstarlet`
    autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
  augroup END
endif

"------------------------------------------
" Keymaps
"------------------------------------------

" Set the leader key
let mapleader = "\<Space>"

" An additional, often used, esc
inoremap jj <Esc>

" Make j and k go up and down on the screen, ignoring how lines wrap
nnoremap j gj
nnoremap k gk

" Toggle paste
nnoremap <Leader>p :set paste!<CR>

" Toggle wrap
nnoremap <Leader>w :set wrap!<CR>

" Move between panes without the ^W prefix
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Close the current window or pane
nnoremap <C-c> :q!<CR>

" Save changes
nnoremap W :w<CR>

" Save and exit
nnoremap Z :wq<CR>

" Toggle spell checking, and also show list characters like blanks at line
" ends or non-unix eols.
" The `set spellcapcheck=` prevents lowercase words starting a sentence being
" counted as spelling errors.
nnoremap <Leader><Leader> :set spell!<CR> :set list!<CR> :set spellcapcheck= <CR>

" Toggle line numbers
nnoremap <Leader>n :set number!<CR>

" Replace " with '
nnoremap <Leader>' :s/"/'/g<CR>

" Switch horizontal panes to vertical
nnoremap <Leader>v <C-w>t<C-w>H

" Switch vertical panes to horizontal
nnoremap <Leader>h <C-w>t<C-w>K

" Open a new tab page
nnoremap <Leader>t :tabnew<CR>

" Tab for completion
imap <Tab> <C-P>

set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

" Format instead of `ex-mode`. Even Bram Moolenaar recommends this.
" See `help usr_05`
map Q gq

" vim-fugitive extensions
" command Tseeds Tmigration 0
" command Vseeds Vmigration 0
" command Eseeds Emigration 0

"------------------------------------------
" Theme
"------------------------------------------

" If we have color support
if &t_Co > 2 || has('gui_running')
  filetype on        " Use file type to set indent, syntax, etc
  syntax enable      " Use syntax highlighting
  set colorcolumn=80 " 80 character ruler

  set background=dark " Use dark themes, if light/dark choice is available

  " Needed to enable truecolor support
  " See `:h xterm-true-color`
  " https://www.reddit.com/r/vim/comments/5416d0/true_colors_in_vim_under_tmux/
  if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif

  " Needed to prevent terminal from misinterpreting italics
  " See https://github.com/morhetz/gruvbox/issues/119
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"

  " Use gruvbox, a 'retro', pastel-filled theme
  let g:gruvbox_italic = 1
  let g:gruvbox_contrast_dark='hard'
  colorscheme gruvbox
endif

" Use tree style listing for netrw
let g:netrw_liststyle = 1

"------------------------------------------
" Functions
"------------------------------------------

" call `:exec SynGroup()` to show the highlight group under the cursor
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

"------------------------------------------
" Abbreviations
"------------------------------------------

" Easily add a ruby debugger
iabbrev dbug require 'pry';require 'pry-byebug';binding.pry
