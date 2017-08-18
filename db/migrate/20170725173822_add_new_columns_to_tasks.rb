class AddNewColumnsToTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :project_id, :integer
    add_column :tasks, :sprint_number, :integer
    add_column :tasks, :wip_started_date, :datetime
    add_column :tasks, :completed_at, :datetime
    add_column :tasks, :tested_at, :datetime
    add_column :tasks, :deployed_at, :datetime
    add_column :tasks, :requested_by, :integer
  end
end
