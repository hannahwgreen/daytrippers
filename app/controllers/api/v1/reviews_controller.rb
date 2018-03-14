class Api::V1::ReviewsController < ApplicationController
  def index
    render json: { review: Review.all }
  end

  def show
    render json: { review: Review.find(params[:id]) }
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: { review: review }
    else
      render json: { errors: review.errors.full_messages }
    end
  end

  def update
    review = Review.find(params[:id]).update(review_params)
    render json: { review: review }
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    render json: { message: 'Your review has been deleted'}
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
