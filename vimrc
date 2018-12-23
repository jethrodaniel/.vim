"
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

"------------------------------------------------------------
" Basic non-insanse stuff / some Ubuntu defaults
"------------------------------------------------------------

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler	    " Show the cursor position all the time
set showcmd	  " Display incomplete commands
set incsearch " Use incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype indent plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

"------------------------------------------------------------
" Use Pathogen to manage plugins
"------------------------------------------------------------
" All plugin related configuration must follow this line
execute pathogen#infect()

"------------------------------------------------------------
" Backup/swap/temp files
"------------------------------------------------------------
if has("vms")
  set nobackup		" Do not keep a backup file, use versions instead
else
  set backup		  " Keep a backup file (restore to previous version)
  set undofile		" Keep an undo file (undo changes after closing)

  " Put those pesky backups in a single place, also enables persistent undo
  set undodir=~/.vim/undo//
  set backupdir=~/.vim/backup//
  set directory=~/.vim/swp//
endif

"------------------------------------------------------------
" Indentation
"------------------------------------------------------------
set tabstop=2     " Tabs are length 2, globally
set shiftwidth=2  " Insert 2 spaces for indentation
set expandtab     " Use spaces instead of tabs

"------------------------------------------------------------
" Syntax
"------------------------------------------------------------
filetype on       " Use syntax highlighting for current file type
syntax enable     " Enable syntax highlighting

"------------------------------------------------------------
" Word wrap
"------------------------------------------------------------
set nowrap           " do not automatically wrap on load
set formatoptions-=t " do not automatically wrap text when typing

"------------------------------------------------------------
" Panes
"------------------------------------------------------------
" Open new panes below and to the right
set splitbelow
set splitright

"------------------------------------------------------------
" Shortcuts
"------------------------------------------------------------
" Put esc in a better place(s)
inoremap <End> <Esc>
inoremap jj <Esc>

" Use spacebar as <Leader>
let mapleader = "\<Space>"

" Toggle paste
nnoremap <Leader>p :set invpaste<CR>

" Move between panes easier
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"------------------------------------------------------------
" Theme
"------------------------------------------------------------
" 80 character ruler
set colorcolumn=80

" Show line numbers
set number

" Sublime's monokai theme
" see https://github.com/ErichDonGubler/vim-sublime-monokai
colorscheme sublimemonokai

" Additional color configurations
highlight LineNr ctermbg=234
highlight TabLineSel ctermbg=235
highlight StatusLine ctermbg=248 ctermfg=238
highlight StatusLineNC ctermbg=232

" Use tree style listing for netrw
let g:netrw_liststyle = 1

"------------------------------------------------------------
" Functions / Tools
"------------------------------------------------------------
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
