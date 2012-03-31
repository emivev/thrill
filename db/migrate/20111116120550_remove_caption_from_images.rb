class RemoveCaptionFromImages < ActiveRecord::Migration
  def up
    remove_column :images, :caption
  end

  def down
    add_column :images, :caption, :string
  end
end
