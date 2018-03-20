class ReviewSerializer < ActiveModel::Serializer
  attributes :user_id, :id, :updated_at, :trip_id, :body, :rating

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :display_name, :avatar
  end

  belongs_to :user
end
