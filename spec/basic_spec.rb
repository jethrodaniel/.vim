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
  'shortmess'    => 'shortmess=filnxtToOSI',
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
  'tags'         => "tags=./tags,./TAGS,tags,TAGS,tags;/home/#{ENV['USER']}"
}.freeze

describe 'Basic settings (no plugins)' do
  before do
    @vim = Vimrunner.start
    @vim.source "#{Dir.home}/.vim/vimrc"
  end
  after { @vim.kill }

  SETTINGS.each do |setting, value|
    quoted = "'#{setting}'"
    setting_padded = quoted.ljust(15).to_s

    it "#{setting_padded} => '#{value}'" do
      @vim.setting(setting).must_equal value
    end
  end
end
