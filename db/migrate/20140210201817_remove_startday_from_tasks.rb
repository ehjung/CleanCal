class RemoveStartdayFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :startday, :time
  end
end
