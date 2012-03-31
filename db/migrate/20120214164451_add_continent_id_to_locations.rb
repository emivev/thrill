class AddContinentIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :continent_id, :integer
  end
end
