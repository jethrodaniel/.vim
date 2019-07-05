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
  'tags'         => "tags=./tags,./TAGS,tags,TAGS,tags;/home/#{ENV['USER']}"
}.freeze

describe 'Basic settings (no plugins)' do
  before do
    @vim = Vimrunner.start
    @vim.source "#{Dir.home}/.vim/vimrc"
  end
  after { @vim.kill }

  SETTINGS.each do |setting, value|
    it "#{setting} => '#{value}'" do
      @vim.setting(setting).must_equal value
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
end
