class RenameApplicationToApply < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :applications, :applyings
  end
  def self.down
    rename_table :applyings, :applications
  end
end
