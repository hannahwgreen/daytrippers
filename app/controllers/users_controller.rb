class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    end
  end

  def update
    if current_user.admin?
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = 'User was updated.'
        redirect_to admin_index_path
      else
        flash[:alert] = @user.errors.full_messages.first
        render :edit
      end
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = 'User account deleted.'
      redirect_to admin_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :avatar)
  end
end
