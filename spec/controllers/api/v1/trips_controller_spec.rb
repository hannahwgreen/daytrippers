require 'rails_helper'

RSpec.describe Api::V1::TripsController, type: :controller do
  let!(:first_trip) { Trip.create(name: 'Liberty Bell', description: 'Cool trip.') }
  let!(:second_trip) { Trip.create(name: 'Jersey Shore', description: 'Bad trip.') }

  describe 'GET#index' do
    it 'should return a list of all trips' do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json['trips'][0]['name']).to eq 'Liberty Bell'
    end
  end

  describe 'GET#show' do
    it 'should give more information about selected trip' do
      get :show, params: { id: second_trip.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json['trip']['name']).to eq 'Jersey Shore'
    end
  end

  describe 'POST#create' do
    it 'creates a new trip' do
      post_json = { trip: { name: 'Art Museum', description: 'Cool trip.' } }

      prev_count = Trip.count
      post(:create, params: post_json)
      expect(Trip.count).to eq(prev_count + 1)
    end

    it 'returns the json of the newly posted trip' do
      post_json = { trip: { name: 'Art Museum', description: 'Cool trip.' } }

      post(:create, params: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json['trip']['name']).to eq 'Art Museum'
    end
  end

  describe 'PUT#update' do
    it 'updates an existing trip' do
      post_json = { id: second_trip.id, trip: { name: 'Art Museum' } }

      prev_count = Trip.count
      put(:update, params: post_json)
      expect(Trip.count).to eq(prev_count)
    end
    it 'returns updated json of an existing trip' do
      post_json = { id: second_trip.id, trip: { name: 'Art Museum' } }
      put(:update, params: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq 'application/json'
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json['trip']['name']).to eq 'Art Museum'
    end
  end

  describe 'POST#destroy' do
    it 'deletes an existing trip' do
      prev_count = Trip.count
      second_trip.destroy
      expect(Trip.count).to eq(prev_count - 1)
    end
  end
end
