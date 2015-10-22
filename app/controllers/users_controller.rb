class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      render json: "You're in!"
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    render :show
  end


private

  def user_params
    params.require(:user).permit(:email, :password)
  end




end