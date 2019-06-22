" This is a basic script to ensure everything is loaded right.
"
" It should exit non-zero on failure, and zero on success.
"
" Run like so
"
" ```
" vim -c 'so test.vim' && echo 'Success!' || echo 'Failure'
" ```

silent ! echo "a,b,c" > temp.csv
e temp.csv
if exists(':DeleteColumn')
else
  silent ! echo "Failed to load 'csv.vim'" >> error
  cq
endif

if exists(':EditorConfigReload')
else
  silent ! echo "Failed to load 'editorconfig-vim'" >> error
  cq
endif

try
  colorscheme gruvbox
catch
  silent ! echo "Failed to load 'gruvbox'" >> error
  cq
endtry

if exists(':Pdf')
else
  silent ! echo "Failed to load 'open-pdf.vim'" >> error
  cq
endif

if exists('g:airline#extensions#tabline#formatter')
else
  silent ! echo "Failed to load 'vim-airline'" >> error
  cq
endif

if exists('g:airline#extensions#tabline#formatter')
else
  silent ! echo "Failed to load 'vim-airline'" >> error
  cq
endif

if exists(':Rails')
else
  silent ! echo "Failed to load 'vim-rails'" >> error
  cq
endif

if exists(':ruby')
else
  silent ! echo "Failed to load 'vim-ruby'" >> error
  cq
endif

if exists('g:signify_vcs_list')
else
  silent ! echo "Failed to load 'vim-signify'" >> error
  cq
endif

if exists(':XtermColorTable')
else
  silent ! echo "Failed to load 'xterm-color-table'" >> error
  cq
endif

if exists(':ALEInfo')
else
  silent ! echo "Failed to load 'ale'" >> error
  cq
endif

if exists(':EditorConfigReload')
else
  silent ! echo "Failed to load 'editorconfig-vim'" >> error
  cq
endif

if exists(':Obsession')
else
  silent ! echo "Failed to load 'vim-obsession'" >> error
  cq
endif

q
