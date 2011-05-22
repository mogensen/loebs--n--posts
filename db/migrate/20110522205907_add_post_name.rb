class AddPostName < ActiveRecord::Migration
  def self.up
      add_column :posts, :name, :string, :default => "Navn"
  end

  def self.down
      remove_column :posts, :name
  end
end
