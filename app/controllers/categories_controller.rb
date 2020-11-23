class CategoriesController < ApplicationController
  before_action :check_logged_in

  def index
    @categories = Category.all
  end
end
