class CreateRoommates < ActiveRecord::Migration
  def change
    create_table :roommates do |t|
      t.string :name

      t.timestamps
    end
  end
end
