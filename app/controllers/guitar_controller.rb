class GuitarController < ApplicationController

    get '/guitars' do
        @guitars = Guitar.all
        erb :'guitars/index'
    end

    get '/guitars/new' do
        erb :'guitars/new'
    end

    post '/guitars' do
        guitar = Guitar.new(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: params[:image_url])
        if guitar.save
            redirect '/guitars'
        else
            redirect '/guitars/new'
        end
    end

   get '/guitars/:id' do
    @guitar = Guitar.find_by(id: params[:id])
    erb :'guitars/show'
   end

   get '/guitars/:id/edit' do
    @guitar = Guitar.find_by(id: params[:id])
    erb :'/guitars/edit'
   end

   patch '/guitars/:id' do
    guitar = Guitar.find_by(id: params[:id])
    if guitar.update(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: params[:image_url])
        redirect "/guitars/#{guitar.id}"
    else
        redirect "/guitars/#{guitar.id}/edit"
   end
end

    delete '/guitars/:id' do
        guitar = Guitar.find_by(id: params[:id])
        #make sure guitar belongs to user
        guitar.destroy
    end
end