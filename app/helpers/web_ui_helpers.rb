helpers do
  def get_game_message(game)
    game.board.empty? ? game.ui.first_move_message(game.current_player) : game.ui.next_move_message(game.current_player)
  end
end