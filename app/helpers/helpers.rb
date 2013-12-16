helpers do

  def start_game(player_one_type, player_two_type)
    session[:setup] = GameSetup.new(Board.new(3), Player.new(MARKER_X), Player.new(MARKER_O))
    session[:setup].set_opponents
    session[:setup].set_player_types(player_one_type, player_two_type)
    set_sessions(session[:setup].board, session[:setup].player_one, session[:setup].player_two)
  end

  def set_sessions(board, player_one, player_two)
    session[:game] = Game.new(board, player_one, player_two, nil)
    session[:game].ui = WebUI.new(board)
    session[:player_one] = player_one
    session[:player_two] = player_two
  end

end