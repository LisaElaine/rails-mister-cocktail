class Rating < ApplicationRecord
  belongs_to :cocktail
  validates :rating_value, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :rating_value, numericality: { only_integer: true }
end
