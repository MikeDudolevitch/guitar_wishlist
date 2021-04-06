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
        photo_url = !params[:image_url].empty? ? params[:image_url] : "https://i.pinimg.com/originals/0b/0d/bc/0b0dbce265be5db9bf7061b4e8dc83f4.png"
        @guitar = Guitar.new(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: photo_url)
        @guitar.user_id = current_user.id

            if  @guitar.save
                redirect '/guitars'
            else
                redirect '/guitars/error'
            end
    end

    get '/guitars/error' do
        erb :'guitars/error'
    end

   get '/guitars/:id' do
    @guitar = Guitar.find_by(id: params[:id])
    redirect_if_not_authorized
    erb :'guitars/show'
   end

   get '/guitars/:id/edit' do
    @guitar = Guitar.find_by(id: params[:id])
    redirect_if_not_authorized
    erb :'/guitars/edit'
   end

   patch '/guitars/:id' do
    @guitar = Guitar.find_by(id: params[:id])
    redirect_if_not_authorized
    if @guitar.update(maker: params[:maker], model: params[:model], color: params[:color], year_created: params[:year_created], image_url: params[:image_url])
        redirect "/guitars/#{@guitar.id}"
    else
        redirect "/guitars/#{@guitar.id}/edit"
   end
end

    delete '/guitars/:id' do
        @guitar = Guitar.find_by(id: params[:id])
        redirect_if_not_authorized
        @guitar.destroy
        redirect :'/guitars'
    end

    private

    def redirect_if_not_authorized
        if @guitar.user_id != session["user_id"]
            redirect "/guitars"
        end
    end

end