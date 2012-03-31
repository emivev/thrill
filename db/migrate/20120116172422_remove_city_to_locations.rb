class RemoveCityToLocations < ActiveRecord::Migration
  def up
    remove_column :locations, :city
  end

  def down
    add_column :locations, :city, :string
  end
end
