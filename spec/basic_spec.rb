# frozen_string_literal: true

require 'spec_helper'

# TODO: test the rest of the vimrc
#
# vim.echo "has('autocmd')" => 1
#

SETTINGS = {
  'nocompatible' => 'nocompatible',
  'backspace'    => 'backspace=indent,eol,start',
  'ruler'        => 'ruler',
  'showcmd'      => 'showcmd',
  'number'       => 'number',
  'autoindent'   => 'autoindent',
  'shortmess'    => 'shortmess=filnxtToOI',
  'spelllang'    => 'spelllang=en_us',
  'backup'       => 'backup',
  'undofile'     => 'undofile',
  'undodir'      => 'undodir=~/.vim/undo//',
  'backupdir'    => 'backupdir=~/.vim/backup//',
  'directory'    => 'directory=~/.vim/swp//',
  'tabstop'      => 'tabstop=2',
  'shiftwidth'   => 'shiftwidth=2',
  'expandtab'    => 'expandtab',
  'nowrap'       => 'nowrap',
  'sidescroll'   => 'sidescroll=1',
  'splitbelow'   => 'splitbelow',
  'splitright'   => 'splitright',
  'scrolloff'    => 'scrolloff=3',
  'incsearch'    => 'incsearch',
  'ignorecase'   => 'ignorecase',
  'smartcase'    => 'smartcase',
  'wrapscan'     => 'wrapscan',
  'mouse'        => 'mouse=',
  'tags'         => "tags=tags;/home/#{ENV['USER']}"
}.freeze

FEATURES = %w(
  builtin_terms
  X11
  acl
  arabic
  autochdir
  autocmd
  balloon_eval_term
  byte_offset
  channel
  cindent
  clientserver
  clipboard
  cmdline_compl
  cmdline_hist
  cmdline_info
  comments
  conceal
  cryptv
  cscope
  cursorbind
  cursorshape
  dialog_con
  diff
  digraphs
  emacs_tags
  eval
  ex_extra
  extra_search
  file_in_path
  find_in_path
  float
  folding
  gettext
  iconv
  insert_expand
  job
  jumplist
  keymap
  lambda
  langmap
  libcall
  linebreak
  lispindent
  listcmds
  localmap
  menu
  mksession
  modify_fname
  mouse
  mouse_dec
  mouse_netterm
  mouse_sgr
  mouse_urxvt
  mouse_xterm
  multi_byte
  multi_lang
  netbeans_intg
  num64
  packages
  path_extra
  perl
  persistent_undo
  postscript
  printer
  profile
  python3
  quickfix
  reltime
  rightleft
  ruby
  scrollbind
  signs
  smartindent
  startuptime
  statusline
  syntax
  tag_binary
  termguicolors
  terminal
  terminfo
  termresponse
  textobjects
  textprop
  timers
  title
  user_commands
  vartabs
  vertsplit
  viminfo
  virtualedit
  visual
  visualextra
  vreplace
  wildignore
  wildmenu
  windows
  writebackup
  xfontset
  xsmp_interact
  xterm_clipboard
).freeze

describe 'Basic settings (no plugins)' do
  before do
    @vim = Vimrunner.start
    @vim.source "#{Dir.home}/.vim/vimrc"
  end
  after { @vim.kill }

  describe 'settings' do
    SETTINGS.each do |setting, value|
      it "#{setting} => '#{value}'" do
        @vim.setting(setting).must_equal value
      end
    end
  end

  it 'is version 8 or greater' do
    version = @vim.command(':version')
                  .match(/VIM - Vi IMproved (\d.\d)/)
                  .captures
                  .first

    (version.to_f >= 8.0).must_equal true, <<~MSG
      Current vim version: #{version}
      Must have vim 8 or greater in order to use native plugin management.
    MSG
  end

  describe 'compile features' do
    FEATURES.each do |f|
      it "has #{f}" do
        @vim.has?(f).must_equal true
      end
    end
  end
end
