class AddStatusToTask < ActiveRecord::Migration
  def up
  	add_column :tasks, :status, :integer, :default => 1
  end

  def down
  	remove_column :tasks, :status
  end
end
