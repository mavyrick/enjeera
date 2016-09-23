class ChangeApplyingToUserApplication < ActiveRecord::Migration[5.0]
  def change
    def self.up
      rename_table :applyings, :user_applications
    end
    def self.down
      rename_table :applyings, :user_applications
    end
  end
end
