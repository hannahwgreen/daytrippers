class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    reviews = Review.where(trip_id: params[:trip_id]).order('updated_at desc')
    render json: reviews
  end

  def create
    user = current_user
    trip = Trip.find(params[:trip_id])
    review = Review.new(review_params)
    if current_user
      review.user = current_user
    elsif params[:user_id]
      review.user = User.find(params[:user_id])
    end
    review.trip_id = trip.id
    if review.save
      render json: { review: review }
    else
      render json: { errors: review.errors }
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
    render json: { message: 'Your review has been deleted' }
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
