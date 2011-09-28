class AddBucketToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :bucket, :string
  end
end
