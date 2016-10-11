class CreateAcceptedApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :accepted_applications do |t|
      t.references :applying, foreign_key: true

      t.timestamps
    end
  end
end
