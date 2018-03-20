# controller
class Api::V1::ReviewsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    trip = Trip.find(params[:trip_id])
    review = Review.new(review_params)
    review.user = user
    review.trip = trip

    if review.save
      render json: { review: review }
    else
      render json: { errors: review.errors.full_messages }
    end
  end

  def update
    user = User.find(params[:user_id])
    trip = Trip.find(params[:trip_id])
    review = Review.find(params[:id]).update(review_params)
    render json: { review: Review.find(params[:id]) }
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    if current_user.admin?
      flash[:notice] = 'Review deleted'
      redirect_to users_path
    else
    render json: { message: 'Your review has been deleted' }
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
