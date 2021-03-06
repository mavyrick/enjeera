class CreateCompanyUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :company_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    add_index :company_users, :email, unique: true
  end
end
