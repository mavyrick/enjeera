class AddCompanyNameToCompanyUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :company_users, :company_name, :string
  end
end
