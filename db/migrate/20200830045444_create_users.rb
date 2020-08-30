class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name
      t.float :latitude
      t.float :longitude
      t.datetime :registered_at
      t.text :preferences

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :name
    add_index :users, :latitude
    add_index :users, :longitude
    add_index :users, :registered_at
  end
end
