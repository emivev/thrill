class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :trip_id
      t.string :name
      t.text :description
      t.string :price1
      t.string :price2
      t.string :price3

      t.timestamps
    end
  end
end
