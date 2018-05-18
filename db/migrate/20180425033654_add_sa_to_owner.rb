class AddSaToOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :sa, :boolean
  end
end
