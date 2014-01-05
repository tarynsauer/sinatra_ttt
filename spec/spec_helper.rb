require 'simplecov'
SimpleCov.start
require 'sinatra'
require "sinatra/base"
require "sinatra/cookies"
require 'rack/test'
require 'ruby_ttt'
require 'web_board'
require 'web_game'
require 'web_game_setup'
require './game_helpers.rb'
require './app.rb'
set :environment, :test

def app
  TicTacToe.new
end

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.include Rack::Test::Methods
end

class MockPlayer
  attr_accessor :marker, :opponent
  def initialize(marker)
    @marker = marker
    @opponent = nil
  end
end

class MockSession
  def initialize(cookies)
    @cookies = cookies
    @data = cookies['rack.session']
    if @data
      @data = @data.unpack("m*").first
      @data = Marshal.load(@data)
    else
      @data = {}
    end
  end

  def [](key)
    @data[key]
  end

  def []=(key, value)
    @data[key] = value
    session_data = Marshal.dump(@data)
    session_data = [session_data].pack("m*")
    @cookies.merge("rack.session=#{Rack::Utils.escape(session_data)}", URI.parse("//example.org//"))
    raise "session variable not set" unless @cookies['rack.session'] == session_data
  end
end