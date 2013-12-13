# GET ------------------------------
get '/' do
  erb :index
end

get '/play' do
  game = session[:game]
  @message = get_game_message(game)
  game.current_player.next_player_turn unless game.board.empty?
  @board = game.board
  @player_one = session[:player_one]
  @player_two = session[:player_two]
  erb :play
end

# POST------------------------------
post '/' do
  start_game(params["player-one"], params["player-two"], params["difficulty"])
  redirect to '/play'
end

post '/move' do
  verify_move(session[:game], params['move'])
  redirect to '/play'
end