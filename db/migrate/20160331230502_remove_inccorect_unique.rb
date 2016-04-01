class RemoveInccorectUnique < ActiveRecord::Migration
  def change
    remove_index :bands, :user_id
    add_index :bands, :user_id
    add_index :bands, [:name, :album_id], unique: true
    add_index :bands, [:name, :user_id], unique: true
  end
end
