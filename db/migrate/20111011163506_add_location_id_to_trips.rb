class AddLocationIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :location_id, :integer
  end
end
