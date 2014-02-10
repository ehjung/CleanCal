class AddAssignedtoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :assignedto, :array
  end
end
