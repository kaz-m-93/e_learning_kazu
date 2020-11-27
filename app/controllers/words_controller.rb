class WordsController < ApplicationController
  def index
    @user = login_user
    @answers = login_user.answers
  end
end
