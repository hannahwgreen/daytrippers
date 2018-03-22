# controller
class Api::V1::TripsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token

  def index
    trips = Trip.order(:name)
    render json: trips
  end

  def show
    trip = Trip.find(params[:id])
    if current_user
      @user = current_user
      @userVotes = Vote.where('user_id = ? AND trip_id = ?', @user.id, params[:trip_id])
    else
      @userVotes = []
    end
      render json: {
          userVotes: @userVotes,
          trip: trip
        }
  end

  def create
    trip = Trip.new(trip_params)

    trip.user = current_user
    if current_user
      trip.user = current_user
    elsif params[:user_id]
      trip.user = User.find(params[:user_id])
    end

    if trip.save
      render json: { trip: trip }
    else
      render json: { errors: trip.errors.full_messages }, status: :unprocessable_entry
    end
  end

  def update
    Trip.find(params[:id]).update(trip_params)
    render json: { trip: Trip.find(params[:id]) }
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    if current_user.admin?
      flash[:notice] = 'Trip deleted'
      redirect_to users_path
    else
      render json: { message: 'Your trip has been deleted' }
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description)
  end
end
