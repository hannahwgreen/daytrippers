require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do

  let!(:first_trip) { Trip.create(name: "Liberty Bell") }
  let!(:second_trip) { Trip.create(name: "Jersey Shore") }
  let!(:r1) { Review.create(user_id: 1, trip_id: 1, rating: 1) }
  let!(:r2) { Review.create(user_id: 2, trip_id: 1, rating: 4) }
  let!(:r3) { Review.create(user_id: 1, trip_id: 2, rating: 3) }

  describe "GET#show" do
    it "should show reviews for the trip selected" do
      get :show, params: {id: second_trip.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq ("application/json")
      expect(returned_json["trip"]["name"]).to eq "Jersey Shore"
    end
  end

  describe "POST#create" do
    it "creates a new trip" do
      post_json = { trip: { name: "Art Museum" } }

      prev_count = Trip.count
      post(:create, params: post_json)
      expect(Trip.count).to eq(prev_count + 1)
    end

    it "returns the json of the newly posted trip" do
      post_json = { trip: { name: "Art Museum" } }

      post(:create, params: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["trip"]["name"]).to eq "Art Museum"
    end
  end

  describe "PUT#update" do
    it "updates an existing trip" do
      post_json = { id: second_trip.id, trip: { name: "Art Museum" } }

      prev_count = Trip.count
      put(:update, params: post_json)
      expect(Trip.count).to eq(prev_count)
    end
    it "returns updated json of an existing trip" do
      post_json = { id: second_trip.id, trip: { name: "Art Museum" } }
      put(:update, params: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["trip"]["name"]).to eq "Art Museum"
    end
  end

  describe "POST#destroy" do
    it "deletes an existing trip" do
      prev_count = Trip.count
      second_trip.destroy
      expect(Trip.count).to eq(prev_count - 1)
    end
  end
  end
