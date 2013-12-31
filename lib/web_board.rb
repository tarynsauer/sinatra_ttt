require 'ruby_ttt'

class WebBoard < RubyTictactoe::Board

  def print_active_board
    board_string = ''
    all_rows.each do |row|
      board_string += "<div class='row'>"
      row.each { |cell| board_string += "<button name='move' value='#{cell}'> #{all_cells[cell]} <span class='cell'>.</span></button>" }
      board_string += "</div>"
    end
    board_string
  end

  def print_inactive_board
    board_string = ''
    all_rows.each do |row|
      board_string += "<div class='row'>"
      row.each { |cell| board_string += "<button> #{all_cells[cell]} <span class='cell'>.</span></button>" }
      board_string += "</div>"
    end
    board_string
  end

end