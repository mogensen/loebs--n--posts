class AddLoebIdToTeam < ActiveRecord::Migration
  def self.up
      add_column :teams, :loeb_id, :integer
  end

  def self.down
      remove_column :teams, :loeb_id
  end
end
