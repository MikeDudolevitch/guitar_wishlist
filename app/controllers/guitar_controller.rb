class GuitarController < ApplicationController

    get '/guitars' do
        @guitars = current_user.guitars
        erb :index
    end

    

end