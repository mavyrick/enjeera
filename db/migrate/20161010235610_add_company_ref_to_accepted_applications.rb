class AddCompanyRefToAcceptedApplications < ActiveRecord::Migration[5.0]
  def change
    add_reference :accepted_applications, :company, foreign_key: true
  end
end
