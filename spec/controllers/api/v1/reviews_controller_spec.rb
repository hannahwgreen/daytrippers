require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:u1) { User.create!(email: 'joe1@joe.com', password: 'phillyphilly', display_name: 'joe') }
  let!(:first_trip) { Trip.create!(name: 'Liberty Bell', user_id: u1.id, location_id: 3, description: 'Cool trip.') }
  let!(:second_trip) { Trip.create!(name: 'Jersey Shore', user_id: u1.id, location_id: 3, description: 'Bad trip.') }
  let!(:r1) { Review.create!(user_id: u1.id, trip_id: first_trip.id, rating: 1, body: 'Great') }
  let!(:v1) { Vote.create!(user_id: u1.id, review_id: r1.id, value: 2, trip_id: second_trip.id) }

  describe 'POST#create' do
    it 'creates a new review' do
      u1.confirm
      sign_in u1
      post_json = {
        review: {
          rating: 4,
          body: 'Great'
        },
        user_id: u1.id,
        trip_id: first_trip.id
      }

      prev_count = Review.count
      post(:create, params: post_json)
      expect(Review.count).to eq(prev_count + 1)
    end

    it 'returns the json of the newly posted review' do
      u1.confirm
      sign_in u1
      post_json = {
        review: {
          rating: 4,
          body: 'Great'
        },
        user_id: u1.id,
        trip_id: first_trip.id
      }

      post(:create, params: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json['review']['review']['user_id']).to eq u1.id
    end
  end

  describe 'GET#index' do
    it 'users see votes on the reviews' do
      u1.confirm
      sign_in u1
      get(:index, params: {trip_id: first_trip.id})

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json['reviews'][0]['review']['trip_id']).to eq first_trip.id
    end
  end
end
