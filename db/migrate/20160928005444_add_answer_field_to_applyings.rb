class AddAnswerFieldToApplyings < ActiveRecord::Migration[5.0]
  def change
    add_column :applyings, :answer, :text
  end
end
