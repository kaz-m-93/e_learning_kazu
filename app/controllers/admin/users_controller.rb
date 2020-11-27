class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    User.find(params[:id].to_i).update_attribute(:is_admin, true)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    User.find(params[:id]).update_attribute(:is_admin, false)
    redirect_back(fallback_location: root_path)
  end
end
