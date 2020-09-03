class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :status
      t.boolean :verified
      t.date :published_on

      t.timestamps
    end
  end
end
