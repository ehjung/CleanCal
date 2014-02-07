class AddScheduleidToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :scheduleid, :integer
  end
end
