class AddTokenAndSecretToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :linkedin_token, :string
    add_column :users, :linkedin_secret, :string
  end
end
