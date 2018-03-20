class UsersController < ApplicationController  
  def index
    @user = current_user
    if current_user.try(:admin?)
      @users = User.all.order(:display_name)
    else
      flash[:notice] = 'You need permission to see this page'
      redirect_to root_path
    end
  end

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      flash[:notice] = 'User account deleted'
      render :index
    end
  end
end
