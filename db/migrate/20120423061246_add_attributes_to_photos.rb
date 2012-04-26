class AddAttributesToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :caption, :string
    add_column :photos, :num_likes, :integer
    add_column :photos, :num_dislikes, :integer
  end

  def self.down
    remove_column :photos, :name
    remove_column :photos, :num_likes
    remove_column :photos, :num_dislikes
  end
end
