class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # result 0:not learned 1:continue 2:learned
end
