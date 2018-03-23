class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :secret_id
      t.references :room, foreign_key: true

      t.timestamps
    end
    add_index :users, :secret_id, unique: true
  end
end
