class AddGeocodingFieldsToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :address, :string
    add_column :companies, :longitude, :float
    add_column :companies, :latitude, :float
  end
end
