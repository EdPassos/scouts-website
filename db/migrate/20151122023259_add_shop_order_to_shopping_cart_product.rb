class AddShopOrderToShoppingCartProduct < ActiveRecord::Migration
  def change
    add_reference :shopping_cart_products, :shop_order, index: true, foreign_key: true
  end
end
