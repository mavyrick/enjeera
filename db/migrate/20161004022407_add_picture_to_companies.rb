class AddPictureToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :picture, :string
  end
end
