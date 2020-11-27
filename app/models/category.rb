class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  def get_user_lesson(user)
    if lessons && lesson ||= lessons.find_by(user_id: user.id)
      return lesson
    end
  end
end
