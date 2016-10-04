class AddPositionToApplicationQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :application_questions, :position, :integer
  end
end
