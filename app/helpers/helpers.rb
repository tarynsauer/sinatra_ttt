helpers do

  def start_game(player_one_type, player_two_type)
    board = Board.new(3)
    session[:setup] = WebGameSetup.new(WebUI.new(board), Player.new(MARKER_X), Player.new(MARKER_O))
    session[:setup].set_opponents
    session[:setup].set_player_types(player_one_type, player_two_type)
    set_sessions(session[:setup])
  end

  def set_sessions(setup)
    session[:game] = Game.new(setup.board, setup.ui, setup.player_one, setup.player_two, nil)
    session[:player_one] = setup.player_one
    session[:player_two] = setup.player_two
  end

end