class AddColumnsWithValidationsToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :user_id, :integer, null: false
    add_column :trips, :location_id, :integer
    add_column :trips, :name, :string, null: false
  end
end
