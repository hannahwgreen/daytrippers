class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :categories, :image_url, :user_id

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :display_name, :avatar
  end

  belongs_to :user
end
