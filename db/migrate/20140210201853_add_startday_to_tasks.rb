class AddStartdayToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :startday, :datetime
  end
end
