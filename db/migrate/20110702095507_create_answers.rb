class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :loeb_id
      t.integer :post_id
      t.integer :team_id
      t.integer :no_of_answers
      t.text :answers

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
