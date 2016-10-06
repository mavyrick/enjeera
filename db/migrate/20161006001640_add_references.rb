class AddReferences < ActiveRecord::Migration[5.0]

  def change
    add_reference :application_answers, :application_question, foreign_key: true
  end

end
