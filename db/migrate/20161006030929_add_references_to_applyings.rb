class AddReferencesToApplyings < ActiveRecord::Migration[5.0]
  def change
    add_reference :application_questions, :applying, foreign_key: true
  end
end
