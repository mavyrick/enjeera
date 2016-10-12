class AddAcceptedToApplyings < ActiveRecord::Migration[5.0]
  def change
    add_column :applyings, :accepted, :boolean
  end
end
