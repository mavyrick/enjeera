class CreateCompanyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :company_questions, &:timestamps
  end
end
