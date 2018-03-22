class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer "user_id", null: false
      t.integer "value", null: false
      t.integer "review_id", null: false
      t.integer "trip_id"
      t.index ["user_id", "review_id"], name: "index_votes_on_user_id_and_review_id", unique: true

      t.timestamps
    end
  end
end
