class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.string :contact
      t.string :code
      t.text :team_members

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
