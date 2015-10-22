class BandsController < ApplicationController

  before_action :user_must_be_signed_in
  
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

  def index
    @bands = Band.all
    render :index
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    render json: "Band destroyed"
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end



  private
  def band_params
    params.require(:band).permit(:name)
  end


end
