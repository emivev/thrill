class CreateCategoriesTripsJoinTable < ActiveRecord::Migration
  def self.up
   create_table :categories_trips, :id => false do |t|
    t.integer :category_id
    t.integer :trip_id
  end
 end 

  def self.down
    drop_table :categories_trips 
  end
end
