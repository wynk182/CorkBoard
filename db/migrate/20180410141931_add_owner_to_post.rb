class AddOwnerToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :owner, foreign_key: true
  end
end
