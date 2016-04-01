class RemoveRedundantKeys < ActiveRecord::Migration
  def change
    remove_column :albums, :band_id
    remove_column :tracks, :album_id
  end
end
