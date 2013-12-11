require 'rubygems'
require 'sinatra'

# GET #########
get '/' do
  erb :index
end

get '/play' do
  erb :play
end

# POST #########
put '/' do
  # Create new game with form params
end