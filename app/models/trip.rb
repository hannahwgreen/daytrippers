class Trip < ApplicationRecord
  has_many :reviews
  has_many :categories
  
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
end
