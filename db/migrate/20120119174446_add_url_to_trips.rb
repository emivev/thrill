class AddUrlToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :url, :string
  end
end
