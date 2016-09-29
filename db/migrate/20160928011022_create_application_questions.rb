class CreateApplicationQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :application_questions do |t|
      t.string :question
      t.text :answer
      t.references :applying, foreign_key: true

      t.timestamps
    end
  end
end
