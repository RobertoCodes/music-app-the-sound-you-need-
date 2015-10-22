class AlbumsController < ApplicationController

    before_action :user_must_be_signed_in


    def new
      @album = Album.new
      @bands = Band.all
      render :new
    end

    def create
      @album = Album.new(album_params)
      @band = @album.band
      if @album.save
        render :show
      else
        render :new
      end
    end

    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      render json: "Album destroyed"
    end

    def show
      @album = Album.find(params[:id])
      @band = @album.band
      render :show
    end

    def edit
      @album = Album.find(params[:id])
      @bands = Band.all
      render :edit
    end

    def update
      @album = Album.find(params[:id])
      @album.update(album_params)
      @band = @album.band
      render :show
    end

    def user_must_be_signed_in
      if @current_user.nil?
        redirect_to new_session_url
      end
    end


    private
    def album_params
      params.require(:album).permit(:title, :band_id, :type_of_album)
    end

end
