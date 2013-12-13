# GET ------------------------------
get '/' do
  session.clear
  erb :index
end

get '/play' do
  game = session[:game]
  @message = game.game_status_check
  game.current_player.next_player_turn unless game.board.empty?
  @message = get_game_message(game) if @message.nil?
  @board = game.board
  @player_one = session[:player_one]
  @player_two = session[:player_two]
  erb :play
end

get '/difficulty' do
  erb :difficulty
end

# POST------------------------------
post '/' do
  start_game(params["player-one"], params["player-two"])
  if computer_player_selected?
    redirect to '/difficulty'
  else
    redirect to '/play'
  end
end

post '/move' do
  verify_move(session[:game], params['move'])
  redirect to '/play'
end

post '/difficulty' do
  session[:game].difficulty_level = params['difficulty']
  redirect to '/play'
end