class CreateTripsTypesJoinTable < ActiveRecord::Migration
  def up
   create_table :trips_types, :id => false do |t|   
    t.integer :trip_id
    t.integer :type_id
  end
end

  def down
   drop_table :trips_types 
  end
end



