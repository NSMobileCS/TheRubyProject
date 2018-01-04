class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, length: { in: 2..40 }, format: { with: EMAIL_REGEX }

  has_one :playlist
  has_one :addcount
  has_many :liked_songs, through: :playlist, source: :songs

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

end
