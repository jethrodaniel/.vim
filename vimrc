"
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"
"------------------------------------------

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler       " Show the cursor position all the time
set number      " Show line numbers
set showcmd     " Display incomplete commands
set autoindent  " Always set autoindenting on

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
set smartcase   " ... unless search contains at least one capital
set wrapscan    " Enable search around end of file

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
  augroup END
endif

setlocal spelllang=en_us                 " Spelling options
set spellfile=~/.vim/spell/en.utf-8.add  " Words added with `zg`

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

" Open new horizontal splits at the bottom of the current window
set splitbelow

" Open new vertical splits to the right of the current window
set splitright

" Set the leader key
let mapleader = "\<Space>"

" An additional, often used, esc
inoremap jj <Esc>

" Toggle paste
nnoremap <Leader>p :set paste!<CR>

" Move between panes without the ^W prefix
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Close the current window or pane
nnoremap <C-c> <C-w><C-c>

" Save changes
nnoremap W :w<CR>

" Exit without saving changes
nnoremap X :q!<CR>

" Save and exit
nnoremap Z :wq<CR>

" If we have terminal support
if has('terminal')
  " Toggle term normal mode when in `:terminal`
  tnoremap <Esc> <C-\><C-n>
endif

" Toggle spell checking, and also show list characters like blanks at line
" ends or non-unix eols
nnoremap <Leader><Leader> :set spell!<CR> :set list!<CR>

" Toggle line numbers
nnoremap <Leader>n :set number!<CR>

" Switch horizontal panes to vertical
nnoremap <Leader>v <C-w>t<C-w>H

" Switch vertical panes to horizontal
nnoremap <Leader>h <C-w>t<C-w>K

" Open a new tab page
nnoremap <Leader>t :tabnew<CR>

" When using git's `mergetool` with vimdiff
" if &diff
"   map <leader>l :diffget LOCAL<CR>
"   map <leader>b :diffget BASE<CR>
"   map <leader>r :diffget REMOTE<CR>
" endif

" Tab for completion
imap <Tab> <C-P>

set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

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

" Easily add a ruby debugger
iabbrev dbug require 'pry';require 'pry-byebug';binding.pry

set shortmess+=I  " Don't show vim intro screen

set diffopt+=vertical " Make `diffthis` use vertical windows
