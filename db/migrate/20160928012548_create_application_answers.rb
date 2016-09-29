class CreateApplicationAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :application_answers do |t|
      t.references :applying, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
