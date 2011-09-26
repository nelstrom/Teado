class CreateTagsTasks < ActiveRecord::Migration
  def up
    create_table :tags_tasks, :id => false, :force => true do |t|
      t.references :tag
      t.references :task

      t.timestamps
    end
  end

  def down
    drop_table :tags_tasks
  end
end
