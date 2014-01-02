$: << File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra/base'
require 'shotgun'
require 'ruby_ttt'
require 'game_helpers'
require './lib/web_board.rb'
require './lib/web_game.rb'
require './lib/web_game_setup.rb'

class TicTacToe < Sinatra::Base

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'session secret'
end

include GameHelpers

  get '/' do
    session.clear
    erb :index
  end

  get '/play' do
    redirect to '/' if session.nil?
    player_first_move_check
    game = get_game
    @board = game.board
    @message = game.get_message(session[:player_first_move])
    redirect to '/play' if game.computer_move_check(@board, session[:current_board])
    erb :play
  end

  get '/difficulty' do
    erb :difficulty
  end

  post '/' do
    set_user_settings(params['player-one'], params['player-two'], params['board-size'])

    redirect to '/play' if large_board?

    redirect to '/difficulty' if computer_player?(params['player-one'], params['player-two'])

    redirect to '/play'
  end

  post '/move' do
    get_game.human_move_check(params['move'], session[:current_board])
    redirect to '/play'
  end

  post '/difficulty' do
    set_difficulty_levels(params['difficulty-player-1'], params['difficulty-player-2'])
    redirect to '/play'
  end

end