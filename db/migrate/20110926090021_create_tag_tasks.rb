class CreateTagTasks < ActiveRecord::Migration
  def up
    create_table :tag_tasks, :force => true do |t|
      t.references :tag
      t.references :task

      t.timestamps
    end
  end

  def down
    drop_table :tag_tasks
  end
end
