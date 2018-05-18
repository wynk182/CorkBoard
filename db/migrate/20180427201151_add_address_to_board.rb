class AddAddressToBoard < ActiveRecord::Migration[5.1]
  def change
    add_column :boards, :address, :string
  end
end
