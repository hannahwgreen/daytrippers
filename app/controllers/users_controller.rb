class UsersController < ApplicationController
  def index
    @user = current_user
    if current_user.try(:admin?)
      @users = User.all.order(:display_name)
      @trips = Trip.all
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

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    User.find(params[:id]).update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :avatar)
  end
end
