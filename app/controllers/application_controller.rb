# require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dot env gem"
  end

  get "/" do
    erb :welcome
  end

  get '/home' do
    
  end
  
  helpers do
    
  end

end
