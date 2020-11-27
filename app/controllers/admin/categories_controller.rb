class Admin::CategoriesController < ApplicationController
  before_action :check_logged_in
  before_action :check_admin_user

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "the category has been created"
      redirect_to admin_categories_url
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "the category has been edited"
      redirect_to admin_categories_url
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
