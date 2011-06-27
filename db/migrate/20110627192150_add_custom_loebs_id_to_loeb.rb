class AddCustomLoebsIdToLoeb < ActiveRecord::Migration
  def self.up
      add_column :loebs, :custom_id, :string
  end

  def self.down
      remove_column :loebs, :custom_id
  end
end
