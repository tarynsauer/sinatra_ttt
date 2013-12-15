class WebUI < UI

  def print_active_board
    board_string = ''
    board.all_rows.each do |row|
      board_string += "<div class='row'>"
      row.each { |cell| board_string += "<button name='move' value='#{cell}'> #{board.all_cells[cell]} <span class='cell'>.</span></button>" }
      board_string += "</div>"
    end
    board_string
  end

  def print_inactive_board
    board_string = ''
    board.all_rows.each do |row|
      board_string += "<div class='row'>"
      row.each { |cell| board_string += "<button> #{board.all_cells[cell]} <span class='cell'>.</span></button>" }
      board_string += "</div>"
    end
    board_string
  end

  def first_move_message(player)
    "Player '#{player.marker}' goes first."
  end

  def next_move_message(player)
    "Player '#{player.marker}': Make your move."
  end

  def winning_game_message(player)
    "GAME OVER! Player '#{player.marker}' wins!"
  end

  def tie_game_message
    "GAME OVER! It's a tie!"
  end
end