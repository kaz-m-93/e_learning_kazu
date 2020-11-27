class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :followed
  has_many :activities, dependent: :destroy
  has_many :answers, through: :lessons

  VALID_EMAIL = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\Z/
  validates :email, presence: true,
                    format: { with: VALID_EMAIL },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true

  mount_uploader :picture, PictureUploader

  def get_following_relationship(user)
    active_relationships.find_by(follower_id: user.id)
  end

  def get_activities
    activities.order(created_at: :desc)
  end

  def learned_lessons
    lessons.where.not(result: nil)
  end
end
