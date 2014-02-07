class AddScheduleidToRoommates < ActiveRecord::Migration
  def change
    add_column :roommates, :scheduleid, :integer
  end
end
