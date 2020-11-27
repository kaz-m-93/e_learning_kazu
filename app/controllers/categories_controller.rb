class CategoriesController < ApplicationController
  before_action :check_logged_in

  def index
    if params[:filter_val].nil?
      return @categories = Category.all
    end

    ids = login_user.learned_lessons.pluck(:category_id)
    if params[:filter_val].to_i == 1
      @categories = Category.where(id: ids)
    elsif params[:filter_val].to_i == 2
      @categories = Category.where.not(id: ids)
    else
    end
  end
end
