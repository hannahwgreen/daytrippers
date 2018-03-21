class TripsController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @user = current_user
  end

  def show
    @user = current_user
    trip = Trip.find(params[:id])
  end

  def search_results
    @found_trips = Trip.keyword_search(params[:search_keywords])
  end
end
