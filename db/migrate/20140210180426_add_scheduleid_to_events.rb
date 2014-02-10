class AddScheduleidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :scheduleid, :integer
  end
end
