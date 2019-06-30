# frozen_string_literal: true

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

describe 'Settings' do
  before do
    vim.source "#{Dir.home}/.vim/vimrc"
  end

  SETTINGS.each do |setting, value|
    quoted = "'#{setting}'"
    setting_padded = quoted.ljust(15).to_s

    it "has setting #{setting_padded} => '#{value}'" do
      expect(vim.setting setting).to eq value
    end
  end
end
