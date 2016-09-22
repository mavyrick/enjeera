class AddCompanyRefToCompanyUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :company_users, :company, index: true, foreign_key: true
  end
end
