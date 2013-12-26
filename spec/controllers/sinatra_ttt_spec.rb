require 'spec_helper'

describe 'AppController', :type => :controller do

  before :each do
    @player_x = MockPlayer.new('X')
    @player_o = MockPlayer.new('O')
    settings = { :board => MockBoard.new,
                 :player_one => @player_x,
                 :player_two => @player_o,
                 :player_first_move => @player_x}
    @game = WebGame.new(settings)
  end

  context 'helper methods' do

    describe '#show_difficulty_form' do
      it 'returns a WebGame object' do
        show_difficulty_form(1).should == "<fieldset>
      <legend>Player 1 difficulty level:</legend>
      <input type='radio' name='difficulty-player-1' value='computer' id='easy-level'><label for='easy-level' required>Easy</label>
      <input type='radio' name='difficulty-player-1' value='hard computer' id='hard-level'><label for='hard-level' required>Hard</label>
    </fieldset>"
      end
    end

    describe '#get_settings' do
      it 'returns a hash of settings' do
        # session[:player_one_type] = 'human'
        # session[:player_two_type] = 'human'
        # session[:board_size] = 3
        # session[:current_board] = {}
        # session[:player_first_move] = 'test_player'
        # get_settings.is_a?(Hash)
        # session.clear
        pending 'need to set up sessions'
      end
    end

    describe '#set_first_move' do
      it 'returns a player object' do
        pending 'need to set up sessions'
      end
    end

    describe '#get_game' do
      it 'returns a game object' do
        pending 'need to set up sessions'
      end
    end

  end
end