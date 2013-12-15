# GET ------------------------------
get '/' do
  session.clear
  erb :index
end

get '/play' do
  @game = session[:game]
  @board = @game.board
  @player_one = session[:player_one]
  @player_two = session[:player_two]
  @message = @game.game_status_check
  if !@board.game_over?
    @game.current_player.next_player_turn unless @board.empty?
    @message = @game.get_game_message
    if @game.computer_move?
      cell = @game.get_next_move
      @board.add_marker(@game.current_player.marker, cell)
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
  start_game(params["player-one"], params["player-two"])
  if session[:game].computer_player_selected?
    redirect to '/difficulty'
  else
    redirect to '/play'
  end
end

post '/move' do
  session[:game].verify_move(params['move'])
  redirect to '/play'
end

post '/difficulty' do
  session[:game].difficulty_level = params['difficulty']
  redirect to '/play'
end