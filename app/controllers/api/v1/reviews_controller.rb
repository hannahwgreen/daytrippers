class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  before_action :authenticate_user!

  def index
    @reviews = Review.where(trip_id: params[:trip_id]).order('created_at desc')
    @reviews = @reviews.map { |review|
      {
        review: review,
        avatar: review.user.avatar,
        display_name: review.user.display_name,
        votes: review.votes
      }
    }

    @userVotes = []
    @reviews.each do |review|
      if review[:review].votes
        review[:review].votes.each do |vote|
          if vote.user_id = current_user.id
            @userVotes << vote
          end
        end
      end
    end

    render json: {
      reviews: @reviews,
      userVotes: @userVotes
    }
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

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
