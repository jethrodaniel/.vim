# .vim

[![Build Status](https://travis-ci.com/jethrodaniel/.vim.svg?token=ySqdnJm9rLt7T1Fsaj2Q&branch=master)](https://travis-ci.com/jethrodaniel/.vim)

### Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim
```

You should also set your system editor to vim like so:

```
sudo update-alternatives --config editor
```

### brew

To install with [brew](https://brew.sh/)

```
brew install --build-from-source ~/.vim/vim.rb
```

See the [travis file](.travis.yml) for an example.

### apt

```
sudo apt install vim-gnome
```

### What it do

Plugins are handled by vim's native package manager, introduced in vim8.
Be sure your vim is up-to-date!

See vim's `:help packages` for more information.

#### Plugins

- [csv.vim](https://github.com/chrisbra/csv.vim)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim.git)
- [gruvbox](https://github.com/morhetz/gruvbox.git)
- [open-pdf.vim](https://github.com/rhysd/open-pdf.vim.git)
- [vim-airline](https://github.com/vim-airline/vim-airline.git)
- [vim-fish](https://github.com/dag/vim-fish.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-haml](https://github.com/tpope/vim-haml.git)
- [vim-javascript](https://github.com/pangloss/vim-javascript.git)
- [vim-obsession](https://github.com/tpope/vim-obsession.git)
- [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc.git)
- [vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax.git)
- [vim-rails](https://github.com/tpope/vim-rails.git)
- [vim-rhubarb](https://github.com/tpope/vim-rhubarb.git)
- [vim-ruby](https://github.com/vim-ruby/vim-ruby.git)
- [vim-signify](https://github.com/mhinz/vim-signify.git)
- [xterm-color-table.vim](https://github.com/guns/xterm-color-table.vim.git)
- [vim-jsx](https://github.com/mxw/vim-jsx.git)
- [vim-bundler](https://github.com/tpope/vim-bundler.git)
- [ale](https://github.com/w0rp/ale.git)
- [vim-plugin-AnsiEsc](https://github.com/powerman/vim-plugin-AnsiEsc.git)
- [vim-toml](https://github.com/cespare/vim-toml.git)

### What you need to do

Make sure you have the lsps and linters ALE needs available

```
# Ruby
gem install rubocop

# Rust
rustup update
rustup component add rls rust-analysis rust-src
```

Additionally, to get `:tags` working with rust

```
brew install ctags
cargo install rusty-tags
rusty-tags vi
```

### Tests

Using [minitest](https://github.com/seattlerb/minitest) and [vimrunner](https://github.com/AndrewRadev/vimrunner)

```
bundle exec rake
```

To run a partiular spec

```
ruby -I lib:spec spec/derp_spec.rb
ruby -I lib:spec spec/derp_spec.rb --name 'test_name_here'
```

### References

Here's a good spec example, all rights reserved to its authors

- https://github.com/gabebw/vim-spec-runner
