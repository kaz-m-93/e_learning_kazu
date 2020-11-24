class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers
  validates :user_id, uniqueness: { scope: [:category_id] }

  def next_word
    (category.words - words).first
  end

  def correct_answers
    answers.select { |answer| answer.choice.is_correct == true }
  end
end
