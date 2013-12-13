helpers do
  def verify_move(game, cell)
    if game.board.available_cell?(cell)
      game.board.add_marker(game.current_player.marker, cell)
    end
  end
end