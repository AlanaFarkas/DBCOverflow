class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
      t.references :question, foreign_key: true, index: true
      t.references :tag, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
