class AddTripIdToExtras < ActiveRecord::Migration
  def change
    add_column :extras, :trip_id, :integer
  end
end
