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

  def computer_player?(type_one, type_two)
    ((type_one.downcase) == COMPUTER_PLAYER) || ((type_two.downcase) == COMPUTER_PLAYER)
  end
end