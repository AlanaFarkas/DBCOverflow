class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_value
      t.references :user, foreign_key: true, index: true
      t.integer :voteable_id
      t.string :voteable_type

      t.timestamps null: false
    end
  end
end
