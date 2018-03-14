class Api::V1::TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @reviews = @trip.reviews
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render :new
    else
      errors = @trip.errors.full_messages
    end
    flash[:alert] = errors
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id]).update(trip_params)
  end

  def delete
    Trip.find(params[:id]).delete
  end

private

  def trip_params
  params.require(:trips).permit(
    :name, :description. :image_url)
  end
end
