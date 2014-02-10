class RemoveScheduleidFromCalendar < ActiveRecord::Migration
  def change
    remove_column :calendars, :scheduleid, :integer
  end
end
