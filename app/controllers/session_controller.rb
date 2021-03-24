class SessionController < ApplicationController

    #login route form
    #login route POST
    #logout route
    
    get '/login' do
        erb :login
    end

    post '/login' do
        #find user- if authenticated redirect to main route, else /login w/ message
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/guitar'
        else 
            redirect '/login'
        end
    end

    delete 'logout' do 
    #logout a user
    end
end