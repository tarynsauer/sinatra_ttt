require 'spec_helper'

describe 'WebBoard' do
  before :each do
     @board = WebBoard.new(3)
     @board.all_cells = {"1A"=>nil, "2A"=>'X', "3A"=>nil,
                        "1B"=>nil, "2B"=>nil, "3B"=>nil,
                        "1C"=>nil, "2C"=>nil, "3C"=>nil}
   end

  describe '#print_active_board' do
    it 'prints cells with value attributes' do
      @board.print_active_board.should include("<button name='move' value='2A'> X <span class='cell'>.</span></button>")
    end
  end

  describe '#print_inactive_board' do
    it 'prints cells without value attributes' do
      @board.print_inactive_board.should include("<button> X <span class='cell'>.</span></button>")
    end
  end

end