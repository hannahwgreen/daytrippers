class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    
    if current_user.admin?
      @users = User.all.order(:display_name)
      @trips = Trip.all.order(:name)
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end

end
