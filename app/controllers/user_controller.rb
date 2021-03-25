class UserController < ApplicationController

    #sign_up FORM
    #User.new(email: params[:email], password: params{:password})
    #signip route POST (actually logs in)
    get '/signup' do
        redirect_if_already_logged_in
        erb :'users/new'
    end

    post '/signup' do
        redirect_if_already_logged_in
        user = User.new(email: params[:email], password: params[:password])
        if user.save 
            session["user_id"] = user.id
            redirect "/guitars"
        else
            redirect "/signup"
        end
    end
end