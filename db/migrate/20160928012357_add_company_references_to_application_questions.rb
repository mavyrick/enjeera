class AddCompanyReferencesToApplicationQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :application_questions, :company, foreign_key: true
  end
end
