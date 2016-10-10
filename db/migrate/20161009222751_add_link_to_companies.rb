class AddLinkToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :link, :string
  end
end
