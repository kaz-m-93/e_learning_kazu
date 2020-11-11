class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if !@user.nil? && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = "you logged in now!"
      redirect_to sessions_path
    else
      flash[:danger] = "please check your email or password"
      render 'new'
    end
  end

  def index
    @user = login_user
  end
end
