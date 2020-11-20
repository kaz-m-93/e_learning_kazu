class LessonsController < ApplicationController
  def create
    @lesson = Lesson.new(user_id: login_user.id, category_id: params[:category_id], result: 0)
    @lesson.save
    redirect_to new_lesson_answer_url(@lesson)
  end
end
