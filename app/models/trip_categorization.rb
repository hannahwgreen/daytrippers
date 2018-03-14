#model (code climate)
class TripCategorization < ApplicationRecord
  belongs_to :trip
  belongs_to :category
end
