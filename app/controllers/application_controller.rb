require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "#dotenv gem from lecture"
  end

  get "/" do
    erb :welcome
  end

  get '/home' do
    erb :index
  end

  get '/login' do
    erb :welcome
  end

end
