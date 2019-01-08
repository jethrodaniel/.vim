"
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

" Use Vim settings, rather than Vi settings
set nocompatible

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler       " Show the cursor position all the time
set number      " Show line numbers
set showcmd     " Display incomplete commands
set incsearch   " Use incremental searching
set autoindent  " Always set autoindenting on

" Only highlight while searching
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Enable mouse support if possible
if has('mouse')
  set mouse=a
endif

" If compiled with support for autocommands
if has('autocmd')
    augroup vimrcEx
  au!
  " When editing a file, always jump to the last known cursor position
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
endif

setlocal spelllang=en_us " Use US English

set backup      " Keep a backup file (restore to previous version)
set undofile    " Keep an undo file (undo changes after closing)

" Put backups in a single place, also enables persistent undo
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

set tabstop=2     " Tabs are length 2, globally
set shiftwidth=2  " Insert 2 spaces for indentation
set expandtab     " Use spaces instead of tabs

set nowrap           " Do not automatically wrap on load
set formatoptions-=t " Do not automatically wrap text when typing

set splitbelow " Open new panes below and to the right
set splitright

" Put esc in a better place(s)
inoremap jj <Esc>

" space-p to toggle paste
nnoremap <Space>p :set paste!<CR>

" Move between panes without the ^W prefix
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" ^c to close the current window or pane
nnoremap <C-c> <C-w><C-c>

" ^c^c to close the current window or pane by force
nnoremap <C-c><C-c> :q!<CR>

" If we have terminal support
if has('terminal')
  "<Esc> to toggle term normal mode when in `:terminal`
  tnoremap <Esc> <C-\><C-n>

  " space-t for a terminal in a new tab
  nnoremap <Space>t :tab term<CR>
endif

" space-space to toggle spell checking
nnoremap <Space><Space> :set spell!<CR> :set list!<CR>

" If we have color support
if &t_Co > 2 || has('gui_running')
  filetype on        " Use file type to set indent, syntax, etc
  syntax enable      " Use syntax highlighting
  set colorcolumn=80 " 80 character ruler

  colorscheme sublimemonokai " Sublime's monokai theme

  highlight LineNr           ctermbg=234
  highlight TabLineSel       ctermbg=235

  highlight StatusLine       ctermbg=248 ctermfg=238
  highlight StatusLineNC     ctermbg=232
  highlight StatusLineTerm   ctermbg=248 ctermfg=238
  highlight StatusLineTermNC ctermbg=232

  highlight SpellBad                     ctermfg=16
endif

" Use tree style listing for netrw
let g:netrw_liststyle = 1

" call `:exec SynGroup()` to show the highlight group under the cursor
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

iabbrev dbug require 'pry';require 'pry-byebug';binding.pry
