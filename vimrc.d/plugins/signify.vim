" Show sign column all the time, even if there aren't any diffs.
"
" This is being used to display git status in the 'gutter` using
" https://github.com/mhinz/vim-signify
set signcolumn=yes

" Limit number of diffs to search for when displaying the gutter
let g:signify_vcs_list=['git']
