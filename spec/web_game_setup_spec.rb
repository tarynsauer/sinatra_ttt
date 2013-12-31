require 'spec_helper'

describe 'WebGameSetup' do
  before :each do
    @setup = WebGameSetup.new
  end

  describe '#set_up_players' do
    it 'returns a PlayerFactory object' do
      players = @setup.set_up_players('human', 'computer')
      players.is_a?(RubyTictactoe::PlayerFactory)
    end
  end

  describe '#get_first_move_player' do
    it '#get_first_move_player returns a Player object' do
      player = @setup.get_first_move_player('human', 'computer')
      player.is_a?(RubyTictactoe::Player)
    end
  end

  describe '#get_board' do
    it 'returns a Board object' do
      board = @setup.get_board(3, {} )
      board.is_a?(WebBoard)
    end
  end

end