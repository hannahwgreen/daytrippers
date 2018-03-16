class RemoveTripColumns < ActiveRecord::Migration[5.1]
  def up
    remove_column :trips, :user_id
    remove_column :trips, :location_id
    remove_column :trips, :name
  end

  def down
    add_column :trips, :user_id, :integer
    add_column :trips, :location_id, :integer
    add_column :trips, :name, :string
  end
end
