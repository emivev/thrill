class CreateDetailsTripsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :details_trips, :id => false do |t|
     t.integer :detail_id
     t.integer :trip_id
  end
end

  def self.down
   drop_table :details_trips
  end
end
