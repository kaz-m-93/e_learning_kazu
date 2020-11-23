class AnswersController < ApplicationController
  before_action :check_logged_in

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.update_attribute(:result, @lesson.answers.size) if @lesson.answers.size > 0

    if @lesson.next_word
      @answer = @lesson.answers.build
    else
      if @lesson.category.words.size == 0
        flash[:info] = "sorry, there is no words"
        redirect_to categories_url
      else
        flash[:info] = "the lesson has been completed!"
        redirect_to lesson_url(@lesson)
      end
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_paramas)

    if @answer.save
      redirect_to new_lesson_answer_url(@lesson)
    else
      render "new"
    end
  end

  private

  def answer_paramas
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
