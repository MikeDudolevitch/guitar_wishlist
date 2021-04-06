class SessionController < ApplicationController

    get '/login' do
        redirect_if_already_logged_in
        erb :login
    end

    post '/login' do
        redirect_if_already_logged_in
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/guitars'
        else 
            redirect '/login'
        end
    end

    delete '/logout' do
        redirect_if_not_logged_in
        session.clear
        redirect '/login'
    end

end