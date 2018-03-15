class CreateTripCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_categorizations do |t|
      t.integer :trip_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
