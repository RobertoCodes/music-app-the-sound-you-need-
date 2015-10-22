class AddColumnToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :type_of_album, :string
  end
end
