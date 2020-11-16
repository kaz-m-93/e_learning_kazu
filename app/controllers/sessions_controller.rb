class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if !@user.nil? && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = "you logged in now!"
      redirect_to "/dashboard"
    else
      flash.now[:danger] = "please check your email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
