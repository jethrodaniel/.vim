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
  rescue NoMethodError
    {}
  end

  def has_linter? lang, linter
    linters[lang].include? linter
  rescue NoMethodError
    false
  end
end

describe 'ALE' do
  before do
    @vim = Vimrunner.start
    @vim.source "#{Dir.home}/.vim/vimrc.d/plugins/ale.vim"
    @vim.plugin! 'ale'
    @ale = AleHelper.new @vim.command ':ALEInfo'
  end
  after { @vim.kill }

  describe 'ruby' do
    it 'has access to ruby linter rubocop' do
      @ale.has_linter?(:ruby, 'rubocop').must_equal true
    end

    it 'fixes files with rubocop' do
      tmp = Tempfile.new(['test', '.rb']).tap do |t|
        t << <<~FILE
          def foo
          end
        FILE
        t.rewind
      end

      @vim.edit tmp.path

      skip <<~SKIP
        TODO: currently this next line fails with

          Vim(redir):E121: Undefined variable: output

        Probably because of vim being run remotely?
      SKIP

      @vim.command ':ALEFix'

      @vim.write

      IO.read(tmp).must_equal <<~EOF
        def foo; end
      EOF
    end
  end
end
