require 'ruby_ttt'

class WebGameSetup < RubyTictactoe::GameSetup

  def set_up_players(player_one_type, player_two_type)
    RubyTictactoe::PlayerFactory.new(player_one_type, player_two_type)
  end

  def get_first_move_player(player_one_type, player_two_type)
    players = RubyTictactoe::PlayerFactory.new(player_one_type, player_two_type)
    players.player_goes_first
  end

  def get_board(board_size, current_board)
    board = WebBoard.new(board_size)
    board.all_cells = current_board
    board
  end

end