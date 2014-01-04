require 'spec_helper'
ENV['RACK_ENV'] = 'test'
describe 'AppController' do
  include GameHelpers

  class TicTacToe < Sinatra::Base
    helpers Sinatra::Cookies
  end

  describe "GET '/'" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_ok
    end

    it "displays hompage content" do
      get '/'
      expect(last_response.body).to include("Select game options")
    end

    it "clears session" do
      set_cookie("player_one_type=human")
      get '/'
      rack_mock_session.cookie_jar["player_one_type"].should be_nil
    end
  end

  describe "GET '/play'" do
    it "redirects to homepage when session nil" do
      get '/play'
      expect(last_response.redirect?).to be_true
      follow_redirect!
      last_request.path.should == '/'
    end

    it "loads play page" do
      get '/play', { :player_one_type => 'human', :player_two_type => 'human',
                    :board_size => 3, :current_board => { "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil } }
      expect(last_response).to be_ok
    end
  end

  describe "POST '/difficulty'" do
    it "loads page" do
      post '/difficulty', { :player_one_type => 'human', :player_two_type => 'human',
                    :board_size => 3, :current_board => { "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil }, 'difficulty-player-2' => 'hard computer' }
      get_game.player_two.class.should == RubyTictactoe::AIPlayer
    end
  end

  # describe "POST '/'" do
  #   it "sets user settings to session" do
  #     post '/', {'player-one' => "human", 'player-two' => "human", 'board-size' => "3" }
  #     rack_mock_session.cookie_jar[:player_two_type].should == "human"
  #   end
  # end
end