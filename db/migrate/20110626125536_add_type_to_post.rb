class AddTypeToPost < ActiveRecord::Migration
  def self.up
      add_column :posts, :post_type, :string
  end

  def self.down
      remove_column :posts, :post_type
  end
end
