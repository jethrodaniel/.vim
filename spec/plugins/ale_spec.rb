# frozen_string_literal: true

require 'spec_helper'

class AleHelper
  attr_reader :info

  def initialize ale_info
    @info = ale_info
  end

  # Parses
  #
  #   let g:ale_linters = {'ruby': ['rubocop'], 'rust': ['rls'], ...}
  #
  #   => {:ruby=>["rubocop"]}, {:rust=>["rls"]}, ...}
  #
  # Into a hash of linters by language
  def linters
    @info.split("\n")
         .find { |line| line.start_with? 'let g:ale_linters' }
         .sub('let g:ale_enabled = {', '')
         .sub('}', '')
         .split(',')
         .map { |lang| lang.match /'(?<lang>.*)': \[(?<linters>.*)\]/ }
         .map do |match|
           lang = match.named_captures['lang'].to_sym
           linters = match.named_captures['linters'].split(',').map do |linter|
             linter.gsub "'", ''
           end
           {
             lang => linters
           }
         end
         .reduce Hash.new, :merge
  end

  def has_linter? lang, linter
    linters[lang].include? linter
  end
end

describe 'ALE' do
  before do
    @vim = Vimrunner.start
    @vim.source "#{Dir.home}/.vim/vimrc"
    @vim.plugin! 'pack/plugins/start/ale'
    @ale = AleHelper.new @vim.command ':ALEInfo'
  end
  after { @vim.kill }

  describe 'ruby' do
    it 'has access to ruby linter rubocop' do
      @ale.has_linter?(:ruby, 'rubocop').must_equal true
    end

    # TODO: make this work. Currently, no linters are available
    #
    # it 'fixes files with rubocop' do
    #   write_file 'test.rb', <<~FILE
    #     def foo
    #     end
    #   FILE

    #   vim.edit 'test.rb'
    #   vim.command ':ALEFix'
    #   vim.write

    #   expect(IO.read 'test.rb').to eq <<~EOF
    #     def foo; end
    #   EOF
    # end
  end
end
