class PagesController < ApplicationController
  def home
    render "users/dashboard" if login_user
  end
end
