class Admin::WordsController < ApplicationController
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

    index = 0
    unless params[:word][:correct_no].nil?
      while index < @word.choices.size
        @word.choices[index].is_correct = params[:word][:correct_no].to_i == index
        index += 1
      end
    end

    if @word.save
      flash[:success] = "the word has been added into #{@category.title}"
      # ↓ after create index of words, replace the path
      redirect_to admin_categories_url
    else
      render "new"
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  private

  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
end
