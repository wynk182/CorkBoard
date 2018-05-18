class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :location_id
      t.boolean :owned

      t.timestamps
    end
  end
end
