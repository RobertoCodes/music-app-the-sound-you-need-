class AlbumsController < ApplicationController

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

    end




    private
    def album_params
      params.require(:album).permit(:title, :band_id, :type_of_album)
    end

end
