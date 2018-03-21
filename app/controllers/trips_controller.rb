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
  
  def edit
    @user = current_user
    
    if current_user.admin?
      @trip = Trip.find(params[:id])
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end
  
  def update
    @user = current_user
    @trip = Trip.find(params[:id])

    if current_user.admin?
      if @trip.update(trip_params)
        flash[:notice] = "Trip was updated."
        redirect_to admin_index_path
      else
        flash[:alert] = @trip.errors.full_messages.first
        render :edit
      end
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end    
  end
  
  def destroy
    @trip = Trip.find(params[:id])
    
    if current_user.admin?
      @trip.destroy
      flash[:notice] = 'Trip deleted.'
      redirect_to admin_index_path
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end

  def search_results
    @user = current_user
    @found_trips = Trip.keyword_search(params[:search_keywords])
  end
    
  private

  def trip_params
    params.require(:trip).permit(:name, :description)
  end  
end
