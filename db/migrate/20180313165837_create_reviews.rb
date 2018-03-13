class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :trip_id, null: false
      t.text :body
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
