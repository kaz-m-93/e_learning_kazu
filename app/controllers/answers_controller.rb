class AnswersController < ApplicationController
  before_action :check_logged_in

  def new
    @lesson = Lesson.find(params[:lesson_id])

    if @lesson.next_word
      @answer = @lesson.answers.build
    else
      flash[:info] = "sorry, there is no words"
      redirect_to root_url #temporary url instead of show result
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_paramas)

    if @answer.save
      if @lesson.next_word.nil?
        @lesson.update_attribute(:result, 2)
        flash[:info] = "the lesson has been completed!"
        redirect_to root_url #temporary url instead of show result
      else
        @lesson.update_attribute(:result, 1) if @lesson.result == 0
        redirect_to new_lesson_answer_url(@lesson)
      end
    else
      render "new"
    end
  end

  private

  def answer_paramas
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
