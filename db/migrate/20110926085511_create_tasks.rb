class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :priority
      t.integer :assigned_to
      t.datetime :due_at

      t.timestamps
    end
  end
end
