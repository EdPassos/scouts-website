class CreatePhotoAlbums < ActiveRecord::Migration
  def change
    create_table :photo_albums do |t|
      t.string :name
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
