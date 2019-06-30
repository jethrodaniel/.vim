# frozen_string_literal: true

require 'vimrunner'
require 'vimrunner/rspec'

# Helpful monkey patches
module Vimrunner
  class Client
    def plugin! plugin
      plugin_path = File.expand_path '..', __dir__
      add_plugin plugin_path, plugin
    end

    def setting setting
      command("set #{setting}?").strip
    end
  end
end

Vimrunner::RSpec.configure do |c|
  c.reuse_server = false
  c.start_vim { Vimrunner.start }
end
