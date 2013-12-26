  def get_game
    settings = get_settings
    WebGame.new(settings)
  end

  def set_first_move
    setup = WebGameSetup.new
    setup.get_first_move_player(session[:player_one_type], session[:player_two_type])
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

  def show_difficulty_form(number)
    "<fieldset>
      <legend>Player #{number} difficulty level:</legend>
      <input type='radio' name='difficulty-player-#{number}' value='computer' id='easy-level'><label for='easy-level' required>Easy</label>
      <input type='radio' name='difficulty-player-#{number}' value='hard computer' id='hard-level'><label for='hard-level' required>Hard</label>
    </fieldset>"
  end