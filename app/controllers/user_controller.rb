class UserController < ApplicationController

    #sign_up FORM
    #User.new(email: params[:email], password: params{:password})
    #signip route POST (actually logs in)
    get '/signup' do
        #redirect_if_logged_in
        erb :'users/new'
    end

    post '/signup' do
        user = User.new(email: params[:email], password: params[:password])
        if user.save 
            redirect "/login"
        else
            redirect "/signup"
        end
    end
end