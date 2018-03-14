#model (code climate)
class Category < ApplicationRecord
  has_many :trip_categorizations
  has_many :trips, through: :trip_categorizations

  validates :name, presence: true
end
