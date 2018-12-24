# .vim

Vim settings and plugins

### Installation

Copy pasta the following into your terminal, then press <kbd>Enter</kbd>.
```
function install_vim_settings {
  mkdir ~/.vim.bkup && mv ~/.vim ~/.vim{rc,info} ~/.vim.bkup
  git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim
}

function restore_old_vim_settings {
  rm -rf ~/.vim
  find ~ -mindepth 1 -maxdepth 1 -name ".vim*" -exec mv {} ~/.vim.bkup/ \;
  rm -rf ~/.vim.bkup
}

install_vim_settings
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

Vim plugins used:
* [sublimemonokai](https://github.com/ErichDonGubler/vim-sublime-monokai)
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
