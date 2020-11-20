class User < ApplicationRecord
  has_many :lessons, dependent: :destroy
  VALID_EMAIL = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\Z/
  validates :email, presence: true,
                    format: { with: VALID_EMAIL },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }, allow_nil: true

  mount_uploader :picture, PictureUploader
end
