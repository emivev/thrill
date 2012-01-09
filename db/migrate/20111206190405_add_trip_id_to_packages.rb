class AddTripIdToPackages < ActiveRecord::Migration
  def change
    add_column :packages, :trip_id, :integer
  end
end
