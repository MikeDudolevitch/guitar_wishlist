class GuitarController < ApplicationController

    get '/guitars' do
        redirect_if_not_logged_in
        @guitars = current_user.guitars
        erb :'guitars/index'
    end

    get '/guitars/new' do
        redirect_if_not_logged_in
        erb :'guitars/new'
    end

    post '/guitars' do
        redirect_if_not_logged_in
        guitar = Guitar.new(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: params[:image_url])
        guitar.user_id = current_user.id
        if guitar.save
            redirect '/guitars'
        else
            redirect '/guitars/new'
        end
    end

   get '/guitars/:id' do
    redirect_if_not_authorized
    @guitar = Guitar.find_by(id: params[:id])
    erb :'guitars/show'
   end

   get '/guitars/:id/edit' do
    redirect_if_not_authorized
    @guitar = Guitar.find_by(id: params[:id])
    erb :'/guitars/edit'
   end

   patch '/guitars/:id' do
    redirect_if_not_authorized
    guitar = Guitar.find_by(id: params[:id])
    if guitar.update(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: params[:image_url])
        redirect "/guitars/#{guitar.id}"
    else
        redirect "/guitars/#{guitar.id}/edit"
   end
end

    delete '/guitars/:id' do
        redirect_if_not_authorized
        guitar = Guitar.find_by(id: params[:id])
        guitar.destroy
        redirect :'/guitars'
    end

    private

    def redirect_if_not_authorized
        guitar = Guitar.find_by_id(params[:id])
        if guitar.user_id != session["user_id"]
            redirect "/guitars"
        end
    end

end