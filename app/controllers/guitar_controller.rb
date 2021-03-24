class GuitarController < ApplicationController

    get '/guitar' do
        erb :'guitars/new'
    end

    get '/guitar/new' do
        erb :'guitars/new'
    end

    post '/guitar/new' do
        guitar = Guitar.new(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: params[:image_url])
        if guitar.save
            redirect '/guitar/show'
        else
            redirect '/guitar/new'
        end
    end

   get '/guitar/show' do
    @guitars = Guitar.all
    erb :'guitars/show'
   end

   get '/guitar/edit' do
    erb :'/guitars/edit'
   end


end