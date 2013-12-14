class Board

  def print_active_board
    board = ''
    count = 0
    all_rows.each do |row|
      count += 1
      board += "<div class='row#{count}'>"
      row.each { |cell| board += "<button name='move' value='#{cell}'> #{all_cells[cell]} <span class='cell'>.</span></button>" }
      board += "</div>"
    end
    board
  end

  def print_inactive_board
    board = ''
    count = 0
    all_rows.each do |row|
      count += 1
      board += "<div class='row#{count}'>"
      row.each { |cell| board += "<button> #{all_cells[cell]} <span class='cell'>.</span></button>" }
      board += "</div>"
    end
    board
  end

end