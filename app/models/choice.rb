class Choice < ApplicationRecord
  belongs_to :word
  validates :content, presence: true
  validates :is_correct, inclusion: { in: [true, false] }
end
