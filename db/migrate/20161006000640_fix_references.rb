class FixReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :application_questions, :applying_id
  end
end
