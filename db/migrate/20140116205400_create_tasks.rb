class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :action

      t.timestamps
    end
  end
end
