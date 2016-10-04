class AddTagLineToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :tag_line, :string
  end
end
