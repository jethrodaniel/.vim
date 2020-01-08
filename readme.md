# .vim

![](https://img.shields.io/github/license/jethrodaniel/.vim.svg)

> ed is the standard editor

**NOTE**: these settings that assume you're on vim8.

### installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim

sudo update-alternatives --config editor # or set $EDITOR
sudo apt install -y vim-gnome            # gotta have "+ support
```

### what it do

adds a bunch of _essential_ plugins (imo), and something easy on tired eyes.

plugins are handled by vim's native package manager, introduced in vim8 - see
vim's `:help packages` for more information.

NOTE: make sure you have the lsps and linters ale needs available

```
sudo apt install -y ctags

gem install rubocop
gem install ripper-tags

rustup update && rustup component add rls rust-analysis rust-src
cargo install rusty-tags
rusty-tags vi
```

## plugins

all the plugins are added as [git submodules](.gitmodules)

## etc

part of https://github.com/jethrodaniel/dotfiles

## license

MIT. Also, most of `thesaurus/` is copy-pasted, so it has its own licenses.
