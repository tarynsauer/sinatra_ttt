helpers do
  def new_game_setup
    board = Board.new(3)
    player_one = Player.new(MARKER_X)
    player_two = Player.new(MARKER_O)
    GameSetup.new(board, player_one, player_two)
  end

  def start_game(player_one_type, player_two_type)
    setup = new_game_setup
    setup.set_opponents
    setup.who_goes_first
    setup.player_one.player_type = player_one_type
    setup.player_two.player_type = player_two_type
    set_sessions(setup.board, setup.player_one, setup.player_two)
  end

  def set_sessions(board, player_one, player_two)
    session[:game] = Game.new(board, player_one, player_two, nil)
    session[:game].ui = WebUI.new(board)
    session[:player_one] = player_one
    session[:player_two] = player_two
  end
end