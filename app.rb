require 'rubygems'
require 'sinatra'

# GET ------------------------------
get '/' do
  erb :index
end

get '/play' do
  @board      = Board.new(3)
  @player_one = Player.new(MARKER_X)
  @player_two = Player.new(MARKER_O)
  @player_one.player_type = params["player-one"]
  @player_two.player_type = params["player-two"]
  @game = Game.new(@board, @player_one, @player_two, params["difficulty"])
  erb :play
end