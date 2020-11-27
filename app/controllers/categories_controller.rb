class CategoriesController < ApplicationController
  before_action :check_logged_in

  def index
    if params[:filter_val].to_i == 1
      @categories = Category.where(id: login_user.learned_lessons.pluck(:category_id))
    elsif params[:filter_val].to_i == 2
      @categories = Category.all - Category.where(id: login_user.learned_lessons.pluck(:category_id))
    else
      @categories = Category.all
    end
  end
end
