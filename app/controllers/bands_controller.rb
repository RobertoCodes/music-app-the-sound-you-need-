class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      render :show
    else
      render :new
    end

  end

  def destroy

  end



  private
  def band_params
    params.require(:band).permit(:name)
  end


end
