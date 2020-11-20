class LessonsController < ApplicationController
  def create
    @lesson = Lesson.new(user_id: login_user.id, category_id: params[:category_id], result: 0)
    unless @lesson.save
      @lesson = Lesson.find_by(user_id: login_user.id, category_id: params[:category_id])
    end
    redirect_to new_lesson_answer_url(@lesson)
  end
end
