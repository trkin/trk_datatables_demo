class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.text :body
      t.integer :likes

      t.timestamps
    end
    add_index :comments, :body
    add_index :comments, :likes
  end
end
