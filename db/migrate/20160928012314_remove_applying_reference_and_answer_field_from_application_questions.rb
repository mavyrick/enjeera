class RemoveApplyingReferenceAndAnswerFieldFromApplicationQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_reference :application_questions, :applying, foreign_key: true
    remove_column :application_questions, :answer, :text
  end
end
