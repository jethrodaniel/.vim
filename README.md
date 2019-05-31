# .vim

Vim settings and plugins

### Installation

```
git clone --recurse-submodules https://github.com/jethrodaniel/.vim ~/.vim
```

You should also set your system editor to vim like so:

```
sudo update-alternatives --config editor
```

**Note**

If you're using [brew](https://brew.sh/), you'll need to install the gui in
order to get vim complied with `+clipboard`. Gotta have `"+`.

```
brew edit vim
```

Replace `"--enable-gui=no"` with `"--enable-gui=yes"`, then

```
brew reinstall vim
```

### Updating

```
( cd ~/.vim && git checkout master && git pull && git submodule init && git submodule update)
```

### What it do

Plugins are handled by vim's native package manager, introduced in vim8. Be sure your vim is up-to-date!

See vim's `:help packages` for more information.

To see which plugins are used, check out the [.gitmodules](.gitmodules).

