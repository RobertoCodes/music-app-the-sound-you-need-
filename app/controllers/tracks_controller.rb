class TracksController < ApplicationController

    before_action :user_must_be_signed_in

    def new
      @track = Track.new
      @albums = Album.all
      render :new
    end

    def create
      @track = Track.new(track_params)
      @album = @track.album
      if @track.save
        render :show
      else
        render :new
      end
    end

    def show
      @track = Track.find(params[:id])
      @album = @track.album
      @note = Note.new
      render :show
    end

    def destroy
      @track = Track.find(params[:id])
      @track.destroy
      render json: "Track destroyed"
    end

    private
    def track_params
      params.require(:track).permit(:title, :album_id, :track_type, :lyrics)
    end

end
