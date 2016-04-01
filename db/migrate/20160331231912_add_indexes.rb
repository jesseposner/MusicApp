class AddIndexes < ActiveRecord::Migration
  def change
    add_index :albums, :band_id
    add_index :albums, [:name, :band_id], unique: true
  end
end
