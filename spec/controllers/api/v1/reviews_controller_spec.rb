require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let!(:u1) { User.create!(email: 'joe1@joe.com', password: 'phillyphilly', display_name: 'joe') }
  let!(:first_trip) { Trip.create!(name: 'Liberty Bell', user_id: u1.id, location_id: 3, description: 'Cool trip.') }
  let!(:second_trip) { Trip.create!(name: 'Jersey Shore', user_id: u1.id, location_id: 3, description: 'Bad trip.') }
  let!(:r1) { Review.create!(user_id: u1.id, trip_id: first_trip.id, rating: 1, body: 'Great') }

  describe 'POST#create' do
    it 'creates a new review' do
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
      expect(returned_json['review']['user_id']).to eq u1.id
    end
  end

  describe 'PUT#update' do
    it 'updates an existing trip' do
      post_json = {
        id: r1.id,
        review: {
          rating: 2,
          body: 'Bad'
        },
        user_id: u1.id,
        trip_id: first_trip.id
      }

      prev_count = Review.count
      put(:update, params: post_json)
      expect(Review.count).to eq(prev_count)
    end

    it 'returns updated json of an existing trip' do
      post_json = {
        id: r1.id,
        review: {
          rating: 2,
          body: 'Bad'
        },
        user_id: u1.id,
        trip_id: first_trip.id
      }

      put(:update, params: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json['review']['rating']).to eq 2
    end
  end

  describe 'POST#destroy' do
    it 'deletes an existing trip' do
      prev_count = Review.count
      r1.destroy
      expect(Review.count).to eq(prev_count - 1)
    end
  end
end