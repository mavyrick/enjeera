class AddUserReferenceToAcceptedApplications < ActiveRecord::Migration[5.0]
  def change
    add_reference :accepted_applications, :user, foreign_key: true
  end
end
