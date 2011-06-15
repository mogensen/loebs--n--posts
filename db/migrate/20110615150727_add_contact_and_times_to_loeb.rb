class AddContactAndTimesToLoeb < ActiveRecord::Migration
  def self.up
      add_column :loebs, :contact, :string
      add_column :loebs, :start, :timestamp
      add_column :loebs, :slut, :timestamp
  end

  def self.down
      remove_column :loebs, :contact
      remove_column :loebs, :start
      remove_column :loebs, :slut
  end
end
