class RemoveTripIdFromLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :trip_id
  end

  def down
    add_column :locations, :trip_id, :integer
  end
end
