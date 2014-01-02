require 'ruby_ttt'

class WebGame < RubyTictactoe::Game
  attr_accessor :board, :player_one, :player_two, :ui, :player_first_move
  def initialize(settings)
    super
    @ui = RubyTictactoe::UI.new
  end

  def get_message(player)
    return ui.first_move_message(player.marker) if board.empty?
    if board.winner?(current_player.opponent.marker)
      ui.winning_game_message(current_player.opponent.marker)
    elsif !board.moves_remaining?
      ui.tie_game_message
    else
      ui.next_move_message(current_player.marker)
    end
  end

  def get_first_move_player(type_one, type_two)
    RubyTictactoe::PlayerFactory.new(type_one, type_two).player_goes_first
  end

  def computer_move_check(board, current_board)
    if !board.game_over?
      unless current_player.is_a?(RubyTictactoe::HumanPlayer)
        current_player.make_move(board)
        current_board = board.all_cells
        return true
      end
      false
    end
  end

  def human_move_check(move, current_board)
    if current_player.is_a?(RubyTictactoe::HumanPlayer)
      verify_move(move)
      current_board = board.all_cells
    end
  end

end