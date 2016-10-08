class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :location
      t.string :description
      t.string :image
      t.string :headline
      t.string :industry

      t.timestamps
    end
  end
end
