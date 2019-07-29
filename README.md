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
