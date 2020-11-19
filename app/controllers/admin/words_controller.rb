class Admin::WordsController < ApplicationController
  before_action :check_logged_in
  before_action :check_admin_user

  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times do
      @word.choices.build
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "the word has been added into #{@category.title}"
      redirect_to admin_category_words_url(@category)
    else
      render "new"
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find(params[:id])

    if @word.update_attributes(word_params)
      flash[:success] = "the word has been edited"
      redirect_to admin_category_words_url(@word.category_id)
    else
      render "edit"
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    flash[:success] = "the word has been deleted from #{Category.find(params[:category_id]).title}"
    redirect_to admin_category_words_url(@word.category_id)
  end

  private

  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
end
