class AddUserTypeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :site_admin, :boolean
    add_column :users, :company_admin, :boolean
  end
end
