class AddPhotoToShopProducts < ActiveRecord::Migration
  def up
	  add_attachment :shop_products, :photo
  end

  def down
	  remove_attachment :shop_products, :photo
  end
end
