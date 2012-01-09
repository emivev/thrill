class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.string :price1
      t.string :price2
      t.string :price3
      t.string :price4
      t.string :price5

      t.timestamps
    end
  end
end
