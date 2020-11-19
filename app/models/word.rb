class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validates :content, presence: true
  validate :only_one_is_checked

  private

  def only_one_is_checked
    if choices.select{ |choice| choice.is_correct == true }.size != 1
      return errors.add :base, "Must have one correct choice"
    end
  end
end
