class Game

  def verify_move(cell)
    board.add_marker(current_player.marker, cell) if board.available_cell?(cell)
  end

  def get_game_message
    board.empty? ? ui.first_move_message(current_player) : ui.next_move_message(current_player)
  end

  def computer_player_selected?
    (player_one.player_type == 'computer') || (player_two.player_type == 'computer')
  end

  def computer_move?
    current_player.player_type == 'computer'
  end

end