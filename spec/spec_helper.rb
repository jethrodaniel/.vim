# frozen_string_literal: true

require 'minitest/spec'
require 'minitest/autorun'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require 'pathname'
require 'vimrunner'

module Vimrunner
  class Client
    def plugin! plugin
      plugin_path = Pathname.new(Dir.home) + '.vim/pack/plugins/start'
      add_plugin (plugin_path + plugin), "plugin/#{plugin}.vim"
    end

    def setting setting
      command("set #{setting}?").strip
    end
  end
end
