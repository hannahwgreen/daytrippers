# model (code climate)
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :votes

  validates :vote_count, presence: true, numericality: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
