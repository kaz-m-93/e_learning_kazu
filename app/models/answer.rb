class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :choice

  def correct_choice
    word.choices.find { |choice| choice.is_correct == true }
  end
end
