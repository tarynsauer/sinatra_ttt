require 'rubygems'
require 'ruby_ttt'
require 'sinatra'
require 'shotgun'
require './helpers.rb'

# GET ------------------------------
get '/' do
  session.clear
  erb :index
end

get '/play' do
  redirect to '/' if session.nil?
  session[:player_first_move] = set_first_move if session[:player_first_move].nil?
  game = get_game
  @board = game.board
  @message = game.get_message(session[:player_first_move])
  if !@board.game_over?
    unless game.current_player.is_a?(HumanPlayer)
      game.current_player.make_move(@board)
      session[:current_board] = game.board.all_cells
      redirect to '/play'
    end
  end
  erb :play
end

get '/difficulty' do
  erb :difficulty
end

# POST------------------------------
post '/' do
  session[:player_one_type] = params['player-one']
  session[:player_two_type] = params['player-two']
  session[:board_size] = params['board-size'].to_i
  session[:current_board] = WebBoard.new(session[:board_size]).all_cells

  if session[:board_size] > 3
    redirect to '/play'
  end

  if get_game.computer_player?(params['player-one'], params['player-two'])
    redirect to '/difficulty'
  end

  redirect to '/play'
end

post '/move' do
  game = get_game
  if game.current_player.is_a?(HumanPlayer)
    game.verify_move(params['move'])
    session[:current_board] = game.board.all_cells
  end
  redirect to '/play'
end

post '/difficulty' do
  session[:player_one_type] = params['difficulty-player-1'] if params['difficulty-player-1']
  session[:player_two_type] = params['difficulty-player-2'] if params['difficulty-player-2']
  redirect to '/play'
end