class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :secret_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :rooms, :secret_id, unique: true
  end
end
