# reviews controller
class ReviewsController < ApplicationController
  def edit
    @user = current_user

    if current_user.admin?
      @review = Review.find(params[:id])
    else
      flash[:alert] = 'You need permission to see this page.'
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @review = Review.find(params[:id])

    if current_user.admin?
      if @review.update(review_params)
        flash[:notice] = 'Review was updated.'
        redirect_to admin_index_path
      else
        flash[:alert] = @review.errors.full_messages.first
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if current_user.admin?
      @review.destroy
      flash[:notice] = 'Review deleted.'
      redirect_to admin_index_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
