# .vim

Vim settings and plugins

### Installation

```
rm -rf ~/.vim ~/.vim{rc,info} # Or back yours up, if you'd like
git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim
```

Then (inside vim), generate help for the plugins

```
:helptags ALL
```

You should also set your system editor to vim like so:

```
sudo update-alternatives --config editor
```

### Updating

```
( cd ~/.vim && git submodule foreach git checkout master && git pull )
```

### What it do

Plugins are handled by vim's native package manager, introduced in vim8. Be sure your vim is up-to-date!

```
vim --version | grep VIM
```

should output something similar to

```
VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Apr 10 2018 21:31:58)
   system vimrc file: "$VIM/vimrc"
  system gvimrc file: "$VIM/gvimrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
    system menu file: "$VIMRUNTIME/menu.vim"
  fall-back for $VIM: "/usr/share/vim"
```

See vim's `:help packages` for more information.

To see which plugins are used, check out the [.gitmodules](.gitmodules).

