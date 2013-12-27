require 'spec_helper'
describe 'AppController', :type => :controller do

  context 'helper methods' do

    describe '#show_difficulty_form' do

      include GameHelpers

      it 'returns a WebGame object' do
        show_difficulty_form(1).should == "<fieldset>
      <legend>Player 1 difficulty level:</legend>
      <input type='radio' name='difficulty-player-1' value='computer' id='easy-level-1'><label for='easy-level' required>Easy</label>
      <input type='radio' name='difficulty-player-1' value='hard computer' id='hard-level-1'><label for='hard-level' required>Hard</label>
    </fieldset>"
      end
    end

  end
end