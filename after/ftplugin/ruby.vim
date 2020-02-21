" the `\nputs` is because bye-bug won't work if this line is the last line
iabbrev dbug require 'pry';require 'pry-byebug';binding.pry;nil<cr>puts <cr>

" easy rubocop ignore directives
iabbrev rubo # rubocop:disable
