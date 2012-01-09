class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :price
      t.text :description
      t.integer :location_id

      t.timestamps
    end
  end
end
