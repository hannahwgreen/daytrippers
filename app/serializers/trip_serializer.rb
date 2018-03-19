class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :categories
end
