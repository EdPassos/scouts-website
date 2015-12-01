class AddPrecisionToShopProductsPrice < ActiveRecord::Migration
  def change
	  change_column :shop_products, :price, :decimal, :precision => 7, :scale => 2
  end
end
