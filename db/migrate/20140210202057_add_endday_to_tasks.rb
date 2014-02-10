class AddEnddayToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :endday, :datetime
  end
end
