class AddCompanyUserRefToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :company_user, index: true, foreign_key: true
  end
end
