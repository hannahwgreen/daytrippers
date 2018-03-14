class Api::V1::TripsController < ApplicationController

  def index
    render json: { trips: Trip.all }
  end

  def show
    trip = Trip.find(params[:id])
    render json: { trip: trip, review: trip.reviews }
  end

  def create
    trip = Trip.new(trip_params)

    if trip.save
      render json: { trip: trip }
    else
      render json: { errors: trip.errors.full_messages }, status: :unprocessable_entry
    end
  end

  def update
    trip = Trip.find(params[:id]).update(trip_params)
    render json: { trip: Trip.find(params[:id]) }
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    render json: { message: 'Your trip has been deleted' }
  end

private

  def trip_params
  params.require(:trip).permit(
    :name, :description, :image_url)
  end
end
