class AddPostToUpload < ActiveRecord::Migration[5.1]
  def change
    add_reference :uploads, :post, foreign_key: true
  end
end
