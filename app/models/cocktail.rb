class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :ratings, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

  def average_rating
    ratings = self.ratings
    avg = 0
    ratings.each do |rating|
      avg += rating
    end
    avg /= ratings.count if ratings.count.positive?
  end
end
