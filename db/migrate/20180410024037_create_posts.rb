class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :owner_code
      t.string :owner_email
      t.boolean :verified
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
