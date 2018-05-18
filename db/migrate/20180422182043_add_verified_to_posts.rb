class AddVerifiedToPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :verified
    add_column :posts, :verified, :boolean, default: false
  end
end
