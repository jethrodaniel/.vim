# .vim

[![Build Status](https://travis-ci.com/jethrodaniel/.vim.svg?branch=master)](https://travis-ci.com/jethrodaniel/.vim)

Vim settings and plugins

### Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim
```

You should also set your system editor to vim like so:

```
sudo update-alternatives --config editor
```

You need vim installed with a GUI in order to get vim complied with `+clipboard`. Gotta have `"+`.

<details><summary>brew</summary>

TODO: correct this

If you're using [brew](https://brew.sh/), you'll need to install the gui in

```
brew edit vim
```

Replace:

 - `"--enable-gui=no"` with `"--enable-gui=yes"`
 - `"--without-x"`, with `"--with-x"`

```
brew reinstall vim
```

</details>

<details><summary>debian</summary>

```
sudo apt install vim-gnome
```

</details>

### What it do

Plugins are handled by vim's native package manager, introduced in vim8. Be sure your vim is up-to-date!

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

Using [vimrunner](https://github.com/AndrewRadev/vimrunner), which requires [ruby](https://www.ruby-lang.org/en/)

```
bundle exec rspec
```

TODO:

For some reason, running `rspec spec/plugins/ale_spec.rb` fails, but `rspec` works.
