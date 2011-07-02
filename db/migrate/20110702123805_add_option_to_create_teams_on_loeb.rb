class AddOptionToCreateTeamsOnLoeb < ActiveRecord::Migration
  def self.up
      add_column :loebs, :create_teams, :boolean
  end

  def self.down
      remove_column :loebs, :create_teams
  end
end
