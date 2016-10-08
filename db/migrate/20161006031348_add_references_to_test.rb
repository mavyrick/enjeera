class AddReferencesToTest < ActiveRecord::Migration[5.0]
  def change
    add_reference :applyings, :application_question, foreign_key: true
  end
end
