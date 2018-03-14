# hello
class Trip < ApplicationRecord
  has_many :reviews
  has_many :trip_categorizations
  has_many :categories, through: :trip_categorizations
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
