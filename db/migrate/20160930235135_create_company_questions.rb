class CreateCompanyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :company_questions do |t|

      t.timestamps
    end
  end
end
