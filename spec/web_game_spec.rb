require 'spec_helper'

describe 'WebGame' do

  before :each do
    @player_x = RubyTictactoe::HumanPlayer.new('X')
    @player_o = RubyTictactoe::HumanPlayer.new('O')
    @player_x.opponent = @player_o
    @player_o.opponent = @player_x
    settings = { :board => WebBoard.new(3),
                 :player_one => @player_x,
                 :player_two => @player_o,
                 :player_first_move => @player_x}
    @game = WebGame.new(settings)
  end

  describe '#initialize' do
    it 'has the correct UI object' do
      @game.ui.is_a?(RubyTictactoe::UI)
    end
  end

  describe '#get_message' do
    it 'returns first move message when board is empty' do
      @game.board.all_cells = { '1A' => nil, '2A' => nil, '3A' => nil,
                                '1B' => nil,'2B' => nil, '3B' => nil,
                                '1C' => nil, '2C' => nil, '3C' => nil }
      @game.get_message(@player_x).should include('goes first')
    end

    it 'returns tie game message when board shows tie game' do
      @game.board.all_cells = { '1A' => 'X', '2A' => 'X', '3A' => 'O',
                                '1B' => 'O','2B' => 'O', '3B' => 'X',
                                '1C' => 'X', '2C' => 'O', '3C' => 'X' }
      @game.get_message(@player_x).should == "GAME OVER! It's a tie!"
    end

    it 'returns player X wins message when board shows X is winner' do
      @game.board.all_cells = { '1A' => 'X', '2A' => 'X', '3A' => 'X',
                                '1B' => 'O','2B' => 'O', '3B' => nil,
                                '1C' => nil, '2C' => nil, '3C' => nil }
      @game.get_message(@player_x).should == "GAME OVER! Player 'X' wins!"
    end

    it 'returns player O wins message when board shows O is winner' do
      @game.board.all_cells = { '1A' => 'O', '2A' => 'O', '3A' => 'O',
                                '1B' => 'X','2B' => 'X', '3B' => nil,
                                '1C' => nil, '2C' => nil, '3C' => nil }
      @game.get_message(@player_x).should == "GAME OVER! Player 'O' wins!"
    end

    it 'returns player X move message when it is Xs turn' do
      @game.board.all_cells = { '1A' => 'O', '2A' => 'X', '3A' => 'O',
                                '1B' => nil,'2B' => nil, '3B' => nil,
                                '1C' => nil, '2C' => nil, '3C' => nil }
      @game.get_message(@player_x).should == "Player 'X': Make your move."
    end

    it 'returns player O move message when it is Os turn' do
      @game.board.all_cells = { '1A' => nil, '2A' => nil, '3A' => nil,
                                '1B' => 'X','2B' => 'O', '3B' => 'X',
                                '1C' => nil, '2C' => nil, '3C' => nil }
      @game.get_message(@player_x).should == "Player 'O': Make your move."
    end
  end

  describe '#get_first_move_player' do
    it 'returns a player object' do
      player = @game.get_first_move_player('human', 'human')
      player.is_a?(RubyTictactoe::HumanPlayer)
    end
  end

  describe '#computer_player?' do
    it 'returns false if there is no computer player' do
      @game.computer_player?('human', 'human').should be_false
    end

    it 'returns true if there is a computer player' do
      @game.computer_player?('computer', 'human').should be_true
    end
  end

end