class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @vote = Vote.new(vote_params)
    @user = current_user
    @vote.user = @user

    @dbVote = Vote.where('user_id = ? AND review_id = ?', @vote.user_id, @vote.review_id)[0]
    if @dbVote
      if @dbVote.value == @vote.value
        @dbVote.value = 1
      else
        @dbVote.value = @vote.value
      end
      @dbVote.save
      @vote = @dbVote
    else @vote.save
    end

    if @vote.persisted?
      @votes = @vote.review.votes
      @vote.review.vote_count = @votes.map(&:value).inject(0, &:+)-@votes.length
      @vote.review.save

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
    else
      render json: { error: @vote.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :review_id, :trip_id)
  end
end
