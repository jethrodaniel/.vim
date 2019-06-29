# frozen_string_literal: true

SETTINGS = {
  'nocompatible' => 'nocompatible',
  'backspace'    => 'backspace=indent,eol,start',
  'ruler'        => 'ruler',
  'showcmd'      => 'showcmd',
  'number'       => 'number',
  'autoindent'   => 'autoindent'
}.freeze

describe 'Settings' do
  before do
    vim.add_plugin! 'vimrc'
  end

  SETTINGS.each do |setting, value|
    quoted = "'#{setting}'"
    setting_padded = quoted.ljust(15).to_s

    it "has setting #{setting_padded} => '#{value}'" do
      expect(vim.setting setting).to eq value
    end
  end
end
