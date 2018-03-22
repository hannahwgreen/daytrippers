class AddVotecountToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :vote_count, :integer, default: 0
  end
end
