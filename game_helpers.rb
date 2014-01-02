require 'ruby_ttt'

module GameHelpers
  include RubyTictactoe::TictactoeConstants

  def get_game
    settings = get_settings
    WebGame.new(settings)
  end

  def set_first_move
    setup = WebGameSetup.new
    setup.get_first_move_player(session[:player_one_type], session[:player_two_type])
  end

  def set_difficulty_levels(difficulty_one, difficulty_two)
    session[:player_one_type] = difficulty_one if difficulty_one
    session[:player_two_type] = difficulty_two if difficulty_two
  end

  def set_user_settings(player_one, player_two, board_size)
    session[:player_one_type] = player_one
    session[:player_two_type] = player_two
    session[:board_size] = board_size.to_i
    session[:current_board] = WebBoard.new(session[:board_size]).all_cells
  end

  def get_settings
    settings = {}
    setup = WebGameSetup.new
    players = setup.set_up_players(session[:player_one_type], session[:player_two_type])
    settings[:board] = setup.get_board(session[:board_size], session[:current_board])
    settings[:player_one] = players.player_one
    settings[:player_two] = players.player_two
    settings[:player_first_move] = session[:player_first_move]
    settings
  end

  def large_board?
    session[:board_size] > 3
  end

  def computer_player?(type_one, type_two)
    ((type_one.downcase) == COMPUTER_PLAYER) || ((type_two.downcase) == COMPUTER_PLAYER)
  end

  def player_first_move_check
    session[:player_first_move] = set_first_move if session[:player_first_move].nil?
  end

  def show_difficulty_form(number)
    "<fieldset>
      <legend>Player #{number} difficulty level:</legend>
      <input type='radio' name='difficulty-player-#{number}' value='computer' id='easy-level-#{number}'><label for='easy-level' required>Easy</label>
      <input type='radio' name='difficulty-player-#{number}' value='hard computer' id='hard-level-#{number}'><label for='hard-level' required>Hard</label>
    </fieldset>"
  end
end