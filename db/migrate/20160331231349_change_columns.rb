class ChangeColumns < ActiveRecord::Migration
  def change
    remove_column :bands, :album_id
    add_column :albums, :band_id, :integer
  end
end
