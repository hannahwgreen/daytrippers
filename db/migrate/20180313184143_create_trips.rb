class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :name
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
