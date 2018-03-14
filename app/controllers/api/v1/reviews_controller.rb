class Api::V1::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render :new
    else
      errors = @review.errors.full_messages
    end
    flash[:alert] = errors
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id]).update(review_params)
  end

  def delete
    Review.find(params[:id]).delete
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
