class AddOwnerToBoard < ActiveRecord::Migration[5.1]
  def change
    add_reference :boards, :owner, foreign_key: true
  end
end
