class ChangeIncludeMapDefaultToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :companies, :include_map, :boolean, default: false
  end
end
