helpers do
  def get_game_message(game)
    if game.game_status_check.nil?
      game.ui.first_move_message(game.current_player) if game.board.empty?
    else
      game.game_status_check
    end
  end
end