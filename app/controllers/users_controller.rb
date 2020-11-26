class UsersController < ApplicationController
  before_action :check_logged_in, only: [:dashboard, :show, :edit, :update]
  before_action :check_login_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "your account has been created"
      redirect_to root_url
    else
      render "new"
    end
  end

  def dashboard
    @user = login_user
    @activities = Activity.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "your account has been updated"
      redirect_to user_url(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
  end

  def check_login_user
    unless login_user?
      flash[:danger] = "sonmething wrong with your operation"
      redirect_to root_url
    end
  end
end
