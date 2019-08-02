"------------------------------------------
" General settings
"------------------------------------------

" Use ALE's function for omnicompletion, see `:help ale-completion`
set omnifunc=ale#completion#OmniFunc

" Always keep gutter open
let g:ale_sign_column_always = 1

" Customize signs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" 200 is the default
let g:ale_lint_delay = 200

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

"------------------------------------------
" Filetype specific
"------------------------------------------

" It's a shame ALE doesn't define these for us to begin with - or does it?
let g:ale_fixers = {}
let g:ale_linters = {}

" All file types
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']

" Ruby
let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_linters['ruby'] = ['rubocop']
" Not sure why this is needed
" let g:ale_ruby_rubocop_options = '-c ~/.config/rubocop/config.yml'

" Rust
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_linters['rust'] = ['rustfmt']
let g:ale_rust_rls_toolchain = 'stable'

" Haml
let g:ale_linters['haml'] = ['haml-lint']
