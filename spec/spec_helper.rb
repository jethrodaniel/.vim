# frozen_string_literal: true

require 'minitest/spec'
require 'minitest/autorun'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'vimrunner'

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


