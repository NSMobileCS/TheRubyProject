class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, length: { in: 2..40 }, format: { with: EMAIL_REGEX }

  has_many :songlikes
  has_many :songs, through: :songlikes


  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

end
