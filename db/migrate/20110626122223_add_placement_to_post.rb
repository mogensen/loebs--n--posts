class AddPlacementToPost < ActiveRecord::Migration
  def self.up
      add_column :posts, :placement, :string
  end

  def self.down
      remove_column :posts, :placement
  end
end
