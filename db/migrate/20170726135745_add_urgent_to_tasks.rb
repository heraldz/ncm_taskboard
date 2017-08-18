class AddUrgentToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :urgent, :boolean
  end
end
