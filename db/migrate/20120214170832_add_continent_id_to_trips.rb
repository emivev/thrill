class AddContinentIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :continent_id, :integer
  end
end
