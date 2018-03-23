class AddDefaultValueToTripImage < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:trips, :image_url, 'https://www.bb-nj.com/wp-content/uploads/2018/01/brigantine-beach-sandy-sunset.jpeg')
  end
end
