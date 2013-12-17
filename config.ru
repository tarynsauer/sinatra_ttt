require './app'

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'session secret'
end

run Sinatra::Application