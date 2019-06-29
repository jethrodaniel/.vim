# frozen_string_literal: true

require 'spec_helper'

describe 'Plugins' do
  before do
    vim.add_plugin! 'plugin/my_plugin.vim'
  end

  it ' behaviour' do
    write_file 'test.rb', <<~FILE
      def foo
        bar
      end
    FILE

    vim.edit 'test.rb'

    vim.write

    expect(IO.read 'test.rb').to eq <<~EOF
      def foo
        bar
      end
    EOF
  end
end
