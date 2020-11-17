class Admin::CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "a category has been created"
      redirect_to admin_categories_url
    else
      render "new"
    end
  end

  def edit
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
