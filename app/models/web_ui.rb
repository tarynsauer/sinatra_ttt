class WebUI < UI
  attr_accessor :board
  def initialize(board)
    @board = board
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