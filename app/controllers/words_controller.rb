class WordsController < ApplicationController
  def index
    @user = login_user
    @answers = Answer.joins(:lesson).merge(Lesson.where(user_id: login_user.id))
  end
end
