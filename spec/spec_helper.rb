# frozen_string_literal: true

require 'vimrunner'
require 'vimrunner/rspec'

module Vimrunner
  class Client
    def add_plugin! plugin
      plugin_path = File.expand_path '..', __dir__
      add_plugin plugin_path, plugin
    end

    def setting setting
      command("set #{setting}?").strip
    end
  end
end

Vimrunner::RSpec.configure do |c|
  c.reuse_server = true
  c.start_vim do
    Vimrunner.start.tap do |vim|
      vim.add_plugin! 'vimrc'
    end
  end
end
