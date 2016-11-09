class ChangeCompanyAdminColumnDefaultToFalseInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :company_admin, :boolean, default: false
  end
end
