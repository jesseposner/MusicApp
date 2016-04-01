class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :bands, :name
    add_index :bands, :album_id, unique: true
    add_index :bands, :user_id, unique: true
  end
end
