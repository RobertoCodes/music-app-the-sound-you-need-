class SessionsController < ApplicationController

  def new
    render :new
  end


  def create
    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
    if @user.nil?
      render json: "Wrong credentials!"
    end
    sign_in!(@user)
    redirect_to bands_url
  end

  def destroy
    sign_out!(current_user)
    redirect_to new_session_url
  end


  # private
  #   def session_params
  #     params.require(:session).permit(:user => {:email, :password})
  #   end

end
