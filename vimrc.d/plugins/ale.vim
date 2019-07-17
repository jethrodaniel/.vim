"------------------------------------------
" ALE settings
"------------------------------------------

" let g:ale_completion_enabled = 1

let g:ale_fixers = {
\   '*': [
\     'remove_trailing_lines',
\     'trim_whitespace'
\   ],
\
\   'ruby': [
\     'rubocop',
\     'remove_trailing_lines',
\     'trim_whitespace'
\   ],
\   'rust': [
\     'rustfmt',
\     'remove_trailing_lines',
\     'trim_whitespace'
\   ],
\ }

let g:ale_linters = {
\  'ruby': ['rubocop'],
\  'rust': ['rls'],
\  'haml': ['haml-lint'],
\ }
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_ruby_rubocop_options = '-c ~/.config/rubocop/config.yml'

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" Use ALE's function for omnicompletion, see `:help ale-completion`
set omnifunc=ale#completion#OmniFunc

let g:ale_completion_excluded_words = ['']

" Always keep gutter open
let g:ale_sign_column_always = 1

" Customize signs
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" 200 is default
let g:ale_lint_delay = 200


