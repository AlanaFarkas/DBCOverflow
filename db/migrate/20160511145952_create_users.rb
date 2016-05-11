class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :bio
      t.string :email, null: false
      t.integer :password_digest, null: false

      t.timestamps null: false

    end
  end
end
