require 'rails_helper'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

RSpec.describe Api::V1::VotesController, type: :controller do
  let!(:u1) { User.create(email: 'joe@joe.com', password: 'phillyphilly', display_name: 'joe') }
  let!(:u2) { User.create(email: 'jane@joe.com', password: 'phillyphilly', display_name: 'jane') }
  let!(:first_trip) { Trip.create(name: 'Liberty Bell', user_id: u1.id, location_id: 3, description: 'Cool trip.') }
  let!(:second_trip) { Trip.create(name: 'Jersey Shore', user_id: u1.id, location_id: 3, description: 'Bad trip.') }
  let!(:review) { FactoryBot.create(:random_review, user: u1, trip: second_trip) }
  let!(:v1) { Vote.create(user_id: u1.id, review_id: review.id, value: 2, trip_id: second_trip.id) }

  describe 'POST#create' do
    it 'creates a new vote' do
      u2.confirm
      sign_in u2
      post_json = {
        vote: {
          user_id: u2.id,
          review_id: review.id,
          value: 0,
          trip_id: second_trip.id
        },
        trip_id: second_trip.id,
        review_id: review.id
      }

      prev_count = Vote.count
      post(:create, params: post_json)
      expect(Vote.count).to eq(prev_count + 1)

    end
  end
end
