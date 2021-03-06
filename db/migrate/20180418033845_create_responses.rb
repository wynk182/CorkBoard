class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.references :owner, foreign_key: true
      t.references :post, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
