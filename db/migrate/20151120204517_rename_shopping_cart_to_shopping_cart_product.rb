class RenameShoppingCartToShoppingCartProduct < ActiveRecord::Migration
  def change
	  rename_table :shopping_carts, :shopping_cart_products
  end
end
