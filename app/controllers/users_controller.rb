class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])

    if current_user.admin?
      @user = User.find(params[:id])
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])

    if current_user.admin?
      if @user.update(user_params)
        flash[:notice] = 'User was updated.'
        redirect_to admin_index_path
      else
        flash[:alert] = @user.errors.full_messages.first
        render :edit
      end
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])

    if current_user.admin?
      @user.destroy
      flash[:notice] = 'User account deleted.'
      redirect_to admin_index_path
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:display_name, :email, :avatar)
  end
end
