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
end
