" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

" this is vim, not vi (enter the 21st century)
set nocompatible

" enable syntax and plugins
syntax enable
filetype plugin on

" cleanup the path (rm /usr/include, for instance)
set path=**

" provide tab-completion for all file-related tasks
"
"   :find foo<TAB>
"   :find *.rb
"
" (and tab to select)
"
" remember, `:b` lets you autocomplete any open buffer, `:ls` to see these
"
set path+=** " search down into subfolders
set wildmenu " display all matching files when we tab complete

" tag support (may need to install ctags first)
"
"   ^]  - to jump to tag under cursor
"   g^] - for ambiguous tags
"   ^t  - to jump back up the tag stack
"
command! Tags !ctags -R . " create the `tags` file

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show the cursor position in the bottom right-corner as (row,column)
set ruler

" use `K` to lookup help under the cursor
set keywordprg=:help

" insert the comment character if we insert a newline after a comment
set formatoptions+=ro

" show the current command being typed
set showcmd

" show line numbers
set number

" browsing files, directories
"
"   :edit main.c
"   <CR>/v/t to open in an h-split/v-split/tab
"
" see `|netrw-browse-maps|`
"
let g:netrw_banner= 0                         " disable annoying banner
let g:netrw_altv= 1                           " open splits to the right
let g:netrw_liststyle= 3                      " minimal tree view
let g:netrw_list_hide= netrw_gitignore#Hide() " don't show what git ignores

" help, make (quickfix controls)
"
" :helpgrep string
" :cn  - go to next
" :cp  - go to previous
" :cl  - list all
" :cc1 - got to the first failure
"

" autocomplete
"
" TODO: use https://github.com/ycm-core/YouCompleteMe ?
"
" see |ins-completion| for details
"
"   ^n   - select next autocomplete (or scroll forward)
"   ^p   - select previous autocomplete (or scroll backward)
"   ^x^n - JUST this file
"   ^x^f - for filenames (uses `path`)
"   ^x^] - for tags
"   ^xk  - dictionary
"   ^xt  - thesaurus
"
set thesaurus=~/.vim/thesaurus/thesaurus.txt

" spell-checking
"
" disabled by default, since it's noisy with code.
"
"   ]s  - next misspelled word
"   [s  - previous misspelled word
"   zg  - add a word
"   1zg - accept first option
"
set dictionary=spell        " make `^xk` use the dict when spell is off
set spell spelllang=en_us   " English, enabled by default
command! Spell set spell!   " `:Spell` to toggle.
set spellfile=~/.vim/spell/en.utf-8.add " set the spell file

" if using fish, set a POSIX shell for vim
"
" see https://github.com/dag/vim-fish
"
if &shell =~# 'fish$'
  set shell=/usr/bin/env bash
endif

"
" splits
"
set splitbelow " open horizontal splits below
set splitright " open vertical splits to the right

"
" searching
"
set incsearch  " highlight searches while typing
set ignorecase " case insensitive search for small caps
set smartcase  " ... unless the search contains at least one capital
set wrapscan   " enable searching around the end of a file

"
" brace-matching
"
runtime! macros/matchit.vim " enchances % with keyword pairs (do-end, etc)

"
" tags
"
set tags=tags;$HOME " search up the directory tree until ~/
" rust tags, ala https://github.com/dan-t/rusty-tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/


"
" spaces, not tabs
"
set autoindent   " add spaces when indenting
set tabstop=2    " tabs are 2 spaces
set shiftwidth=2 " insert 2 spaces for `<<`, `>>`, etc
set expandtab    " use spaces instead of tabs

"
" misc
"
set shortmess-=S      " show count while searching
set diffopt+=vertical " make `diffthis` use vertical windows by default
set scrolloff=0       " show no extra lines below and above the current one
set sidescroll=1      " when scrolling horizontally, move the screen incrementally

"
" backups, swp
"
" no backup or swp files, that's what version control is for
set nobackup
set noundofile
set noswapfile

"
" keymaps
"

" space for the leader key
let mapleader = "\<Space>"

" an additional, often used, esc
inoremap jj <Esc>

" shift-tab for completion
"
" see `:help popupmenu-keys`
"
inoremap <s-Tab> <C-x><C-o>
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,menuone,preview,noselect,noinsert

" make j and k go up and down on the screen, ignoring how lines wrap
nnoremap j gj
nnoremap k gk

" toggle paste
nnoremap <Leader>p :set paste!<CR>

" toggle wrap
nnoremap <Leader>w :set wrap!<CR>

" generate ruby tags file, requires <https://github.com/tmm1/ripper-tags>
nnoremap <Leader>] :! ripper-tags -R <CR>

" move between panes without the ^w prefix
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

nnoremap - :Explore<CR>

" save changes
nnoremap W :w<CR>

" save and exit
nnoremap Z :wq<CR>

" zoom, like tmux's prefix z
nnoremap <C-w>z <C-w>\|<C-w>\_<CR>

" toggle spell checking, and also show list characters like blanks at line
" ends or non-unix eols.
" the `set spellcapcheck=` prevents lowercase words starting a sentence being
" counted as spelling errors.
nnoremap <Leader><Leader> :set spell!<CR> :set list!<CR> :set spellcapcheck= <CR>

" toggle line numbers
nnoremap <Leader>n :set number!<CR>

" replace " with '
nnoremap <Leader>' :s/"/'/g<CR>

" switch horizontal panes to vertical
nnoremap <Leader>v <C-w>t<C-w>H

" switch vertical panes to horizontal
nnoremap <Leader>h <C-w>t<C-w>K

" open a new tab page
nnoremap <Leader>t :tabnew<CR>

" vimium-style tab movements
nnoremap >> :tabmove +1<CR>
nnoremap << :tabmove -1<CR>

" format instead of `ex-mode`. Even Bram Moolenaar recommends this.
" see `help usr_05`
map Q gq

" while in insert mode, use ^u to uppercase the previous word
inoremap <c-u> <esc>bgUwea

"
" theme
"

set colorcolumn=80 " 80 character ruler
set background=dark " Use dark themes, if light/dark choice is available

" needed to enable truecolor support
" see `:h xterm-true-color`
" https://www.reddit.com/r/vim/comments/5416d0/true_colors_in_vim_under_tmux/
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" needed to prevent terminal from misinterpreting italics
" see https://github.com/morhetz/gruvbox/issues/119
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" use gruvbox, a 'retro', pastel-filled theme
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"
" file-type stuff
"

" https://thoughtbot.com/blog/wrap-existing-text-at-80-characters-in-vim
augroup BufRead,BufNewFile *.md setlocal textwidth=80

" Set filetype specific options
augroup indentation_and_options
  autocmd!
  " use literal tabs in makefiles
  autocmd! FileType make setlocal noexpandtab

  " always spell-check commits and add rulers for correct length
  autocmd Filetype gitcommit setlocal spell textwidth=72 colorcolumn=73 colorcolumn+=51
augroup END

" Obsess over every vim instance.
"
" This is really just used to make sure that you can get back to your open
" vim instances after say, a restart.
autocmd VimEnter * :Obsession

"
" functions
"

" call `:exec SynGroup()` to show the highlight group under the cursor
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

"
" abbreviations
"
" see ~/.vim/after/ftplugins/*.vim

"
" load all other config files
"
source ~/.vim/vimrc.d/plugins/airline.vim
source ~/.vim/vimrc.d/plugins/ale.vim
source ~/.vim/vimrc.d/plugins/signify.vim
source ~/.vim/vimrc.d/plugins/csv.vim

" NOTE: the following must be at the end of this configuration

" load all plugins - plugins need to be added to runtimepath before helptags
" can be generated.
packloadall

" load `:help` for all plugins, after plugins have been loaded.
" all messages and errors will be ignored.
silent! helptags ALL
