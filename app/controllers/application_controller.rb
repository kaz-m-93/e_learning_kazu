class ApplicationController < ActionController::Base
  include SessionsHelper

  def check_logged_in
    if login_user.nil?
      session[:user_id] = nil
      flash[:danger] = "please log in"
      redirect root_url
    end
  end

  def check_admin_user
    user = login_user
    unless admin_user?(user)
      flash[:danger] = "please log in with admin user"
      redirect root_url
    end
  end
end
