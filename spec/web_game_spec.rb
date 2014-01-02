require 'spec_helper'

describe 'WebGame' do

  before :each do
    @player_x = MockPlayer.new('X')
    @player_o = MockPlayer.new('O')
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

  describe '#computer_move_check' do
    before :each do
      @player_x = RubyTictactoe::HumanPlayer.new('X')
      @player_o = RubyTictactoe::ComputerPlayer.new('O')
      @player_x.opponent = @player_o
      @player_o.opponent = @player_x
      settings = { :board => WebBoard.new(3),
                   :player_one => @player_x,
                   :player_two => @player_o,
                   :player_first_move => @player_o}
      @game = WebGame.new(settings)
    end

    it 'updates board with computer player #make_move' do
      @game.computer_move_check(@game.board, @game.board.all_cells)
      @game.board.empty?.should be_false
    end

    it 'returns false if current player is human' do
      @game.board.all_cells['1A'] = 'O'
      @game.computer_move_check(@game.board, @game.board.all_cells).should be_false
    end

    it 'does not call #make_move when game is over' do
      @game.board.all_cells['1A'] = 'X'
      @game.board.all_cells['2A'] = 'X'
      @game.board.all_cells['3A'] = 'X'
      @game.computer_move_check(@game.board, @game.board.all_cells)
      @game.board.all_cells.values.compact!.length.should == 3
    end
  end

  describe '#human_move_check' do
    before :each do
      @player_x = RubyTictactoe::HumanPlayer.new('X')
      @player_o = RubyTictactoe::ComputerPlayer.new('O')
      @player_x.opponent = @player_o
      @player_o.opponent = @player_x
      settings = { :board => WebBoard.new(3),
                   :player_one => @player_x,
                   :player_two => @player_o,
                   :player_first_move => @player_x}
      @game = WebGame.new(settings)
    end

    it 'updates board with with move when valid' do
      @game.human_move_check('1A', @game.board.all_cells)
      @game.board.all_cells['1A'].should == 'X'
    end

    it 'does not update board when move is invalid' do
      @game.board.all_cells['1A'] = 'O'
      @game.human_move_check('1A', @game.board.all_cells)
      @game.board.all_cells['1A'].should == 'O'
    end

    it 'does not update board when player is not current player' do
      @game.board.all_cells['1A'] = 'X'
      @game.human_move_check('1B', @game.board.all_cells)
      @game.board.all_cells['1B'].should be_nil
    end
  end
end