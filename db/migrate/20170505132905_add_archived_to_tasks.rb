class AddArchivedToTasks < ActiveRecord::Migration
  def up
  	add_column :tasks, :archived, :boolean
  end

  def down
  	remove_column :tasks, :archived
  end
end
