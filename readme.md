# .vim

![](https://img.shields.io/github/license/jethrodaniel/.vim.svg)

> ed is the standard editor

### installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim
```

you should also set your system editor to vim like so:

```
sudo update-alternatives --config editor
```

gotta have vim, obviously (with `"+` support)

```
# brew install vim
sudo apt install -y vim-gnome
```

### what it do

adds a bunch of _essential_ plugins (imo), and something easy on tired eyes.

plugins are handled by vim's native package manager, introduced in vim8.
be sure your vim is up-to-date!

see vim's `:help packages` for more information.

make sure you have the lsps and linters ale needs available

```
gem install rubocop

rustup update
rustup component add rls rust-analysis rust-src
```

additionally, to get `:tags` working with rust

```
brew install ctags
cargo install rusty-tags
rusty-tags vi
```

## plugins

all the plugins are added as [git submodules](.gitmodules)
