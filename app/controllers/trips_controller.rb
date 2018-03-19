class TripsController < ApplicationController
  def index
    @user = current_user
  end
  def new
  end
  def show 
    trip = Trip.find(params[:id])
  end
end
