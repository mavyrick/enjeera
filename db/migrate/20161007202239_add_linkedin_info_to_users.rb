class AddLinkedinInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :linkedin_raw_info, :text
  end
end
