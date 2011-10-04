class RemovePriorityFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :priority
  end

  def down
    add_column :tasks, :priority
  end
end
