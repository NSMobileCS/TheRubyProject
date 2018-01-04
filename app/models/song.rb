class Song < ApplicationRecord
  validates :title, presence: true, length: { in: 2..40 }
  validates :artist, presence: true, length: { in: 2..40 }

  has_many :playlists
  # has_many :users
  has_many :addcounts
  has_many :playlists, through: :addcount, source: :counts


end
