class AddAasmStateToApplyings < ActiveRecord::Migration[5.0]
  def change
    add_column :applyings, :aasm_state, :string
  end
end
