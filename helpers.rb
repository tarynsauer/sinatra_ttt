helpers do

  def start_game(player_one_type, player_two_type)
    board = Board.new(3)
    game = WebGame.new(board, Player.new(MARKER_X), Player.new(MARKER_O))
    game.set_opponents
    game.set_player_types(player_one_type, player_two_type)
    set_sessions(game)
  end

  def set_sessions(game)
    session[:game] = game
    session[:player_one] = game.player_one
    session[:player_two] = game.player_two
  end

end