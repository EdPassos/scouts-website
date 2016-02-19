class AddAlbumToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :photo_album, index: true, foreign_key: true
  end
end
