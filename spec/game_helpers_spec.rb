require 'spec_helper'

describe 'GameHelpers' do

  include GameHelpers

  before :each do
    def session
      MockSession.new(rack_mock_session.cookie_jar)
    end
  end

  describe '#get_game' do
    before :each do
      session[:player_one_type] = 'human'
      session[:player_two_type] = 'computer'
      session[:board_size] = 3
      session[:current_board] = {"1A"=>nil, "2A"=>'X', "3A"=>nil,
                                 "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                 "1C"=>nil, "2C"=>nil, "3C"=>nil}
    end

    it 'returns a WebGame object' do
      get_game.is_a?(WebGame)
    end

    it 'sets the WebGame player_one attribute' do
      get_game.player_one.is_a?(RubyTictactoe::HumanPlayer)
    end

    it 'sets the WebGame player_two attribute' do
      get_game.player_two.is_a?(RubyTictactoe::ComputerPlayer)
    end

    it 'sets the WebGame board attribute' do
      get_game.board.all_cells == {"1A"=>nil, "2A"=>'X', "3A"=>nil,
                                 "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                 "1C"=>nil, "2C"=>nil, "3C"=>nil}
    end
  end

  describe '#set_difficulty_levels' do
    it 'sets :player_one_type when value exists' do
      set_difficulty_levels('computer', nil)
      session[:player_one_type].should == RubyTictactoe::TictactoeConstants::COMPUTER_PLAYER
    end

    it 'sets :player_two_type when value exists' do
      set_difficulty_levels('computer', 'hard computer')
      session[:player_two_type].should == RubyTictactoe::TictactoeConstants::AI_PLAYER
    end
  end

  describe '#set_user_settings' do
    before :each do
      set_user_settings('human', 'hard computer', '3')
    end

    it 'sets :player_one_type value' do
      session[:player_one_type].should == RubyTictactoe::TictactoeConstants::HUMAN_PLAYER
    end

    it 'sets :player_two_type value' do
      session[:player_two_type].should == RubyTictactoe::TictactoeConstants::AI_PLAYER
    end

    it 'sets :board_size value' do
      session[:board_size].should == 3
    end

    it 'sets :current_board value' do
      session[:current_board].should == {"1A"=>nil, "2A"=>nil, "3A"=>nil,
                                         "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                         "1C"=>nil, "2C"=>nil, "3C"=>nil}
    end
  end

  describe '#computer_player?' do
    it 'returns false if there is no computer player' do
      computer_player?('human', 'human').should be_false
    end

    it 'returns true if there is a computer player' do
      computer_player?('computer', 'human').should be_true
    end
  end

  describe '#large_board?' do
    it 'returns false when board row size of 3' do
      session[:board_size] = 3
      large_board?.should be_false
    end

    it 'returns true when board row size is greater than 3' do
      session[:board_size] = 4
      large_board?.should be_true
    end
  end

  describe '#player_first_move_check' do
    before :each do
      session[:player_one_type] = 'human'
      session[:player_two_type] = 'computer'
    end

    it 'sets :player_first_move if nil' do
      player_first_move_check
      session[:player_first_move].should_not be_nil
    end

    it 'does not reset :player_first_move if not nil' do
      session[:player_first_move] = 'testing'
      player_first_move_check
      session[:player_first_move].should == 'testing'
    end
  end

  describe '#show_difficulty_form' do
    it 'returns a WebGame object' do
      show_difficulty_form(1).should == "<fieldset>
      <legend>Player 1 difficulty level:</legend>
      <input type='radio' name='difficulty-player-1' value='computer' id='easy-level-1'><label for='easy-level' required>Easy</label>
      <input type='radio' name='difficulty-player-1' value='hard computer' id='hard-level-1'><label for='hard-level' required>Hard</label>
    </fieldset>"
    end
  end

end