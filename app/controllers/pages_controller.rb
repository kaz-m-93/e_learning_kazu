class PagesController < ApplicationController
  def home
    redirect_to "/dashboard" if login_user
  end
end
