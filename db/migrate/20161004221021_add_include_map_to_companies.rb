class AddIncludeMapToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :include_map, :boolean
  end
end
