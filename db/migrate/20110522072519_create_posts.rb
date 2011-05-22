class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :description
      t.text :rigtig_svar
      t.string :rigtig_svar_ans
      t.text :forkert_svar
      t.boolean :try_again
      t.integer :loeb_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
