# GET ------------------------------
get '/' do
  session.clear
  erb :index
end

get '/play' do
  @board = session[:game].board
  @message = @board.empty? ? session[:setup].who_goes_first : session[:game].game_status_check
  if !@board.game_over?
    @message = session[:game].advance_game
    if session[:game].computer_move?
      move = session[:game].get_computer_move
      session[:game].verify_move(move)
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
  if session[:setup].computer_player_selected?
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