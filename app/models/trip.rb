# model (code climate)
class Trip < ApplicationRecord
  has_many :reviews
  has_many :trip_categorizations
  has_many :categories, through: :trip_categorizations
  belongs_to :user
  
  validates :name, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  
  def self.keyword_search(keywords)
    where("name ILIKE ? OR description ILIKE ?", "%#{keywords}%", "%#{keywords}%") 
  end
end
