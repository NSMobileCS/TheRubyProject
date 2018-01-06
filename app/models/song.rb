class Song < ApplicationRecord
    validates :title, presence: true, length: { in: 2..40 }
    validates :artist, presence: true, length: { in: 2..40 }

    has_many :songlikes
    has_many :users, through: :songlikes

end
