class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :secret_id
      t.integer :room_id

      t.timestamps
    end
    add_index :users, :secret_id, unique: true
    add_index :users, :room_id
  end
end
