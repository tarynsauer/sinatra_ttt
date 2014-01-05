require 'spec_helper'

describe 'AppController' do

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
      get '/', {}, { 'rack.session' => {:player_one_type => 'human' }}
      rack_mock_session.cookie_jar[:player_one_type].should be_nil
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
      get '/play', {}, { 'rack.session' => {
                                :player_one_type => 'human',
                                :player_two_type => 'human',
                                :board_size => 3,
                                :current_board => {
                                  "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil }
                        }}
      expect(last_response).to be_ok
    end

    it "displays play page content" do
      get '/play', {}, { 'rack.session' => {
                                :player_one_type => 'human',
                                :player_two_type => 'human',
                                :board_size => 3,
                                :current_board => {
                                  "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil }
                        }}
      expect(last_response.body).to include("Make your move")
    end
  end

  describe "GET '/difficulty'" do
    before :each do
      get '/difficulty', {}, { 'rack.session' => {
                                :player_one_type => 'computer',
                                :player_two_type => 'computer',
                                :board_size => 3,
                                :current_board => {
                                  "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil }
                        }}
    end

    it "loads difficulty page" do
      expect(last_response).to be_ok
    end

    it "displays difficulty page content" do
      expect(last_response.body).to include("Select difficulty level")
    end
  end

  describe "POST '/move'" do
    before :each do
      post '/move', {"move"=>"1A"}, { 'rack.session' => {
                                :player_one_type => 'human',
                                :player_two_type => 'human',
                                :board_size => 3,
                                :current_board => {
                                  "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil } }}
    end

    it "adds marker to board" do
      rack_mock_session.cookie_jar[:current_board] == { "1A"=>'O', "2A"=>'X', "3A"=>nil,
                                                        "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                                        "1C"=>nil, "2C"=>nil, "3C"=>nil }
    end

    it "redirects to /play" do
      follow_redirect!
      last_request.path.should == '/play'
    end
  end

  describe "POST '/'" do
    it "large board size redirects to /play" do
      post '/', {"player-one"=>"computer", "player-two"=>"human", "board-size"=>"4"}
      follow_redirect!
      last_request.path.should == '/play'
    end

    it "redirects to /difficulty when computer player" do
      post '/', {"player-one"=>"computer", "player-two"=>"human", "board-size"=>"3"}
      follow_redirect!
      last_request.path.should == '/difficulty'
    end

    it "redirects to /play when human players" do
      post '/', {"player-one"=>"human", "player-two"=>"human", "board-size"=>"3"}
      follow_redirect!
      last_request.path.should == '/play'
    end
  end

  describe "POST '/difficulty'" do
    before :each do
      post '/difficulty', { 'difficulty-player-2' => 'hard computer' }, { 'rack.session' => {
                                :player_one_type => 'human',
                                :player_two_type => 'computer',
                                :board_size => 3,
                                :current_board => {
                                  "1A"=>nil, "2A"=>'X', "3A"=>nil,
                                  "1B"=>nil, "2B"=>nil, "3B"=>nil,
                                  "1C"=>nil, "2C"=>nil, "3C"=>nil } }}
    end

    it "redirects to /play " do
      follow_redirect!
      last_request.path.should == '/play'
    end

    it "assigns correct player type" do
      rack_mock_session.cookie_jar[:player_two_type] == 'hard computer'
    end
  end
end