class ShoppingCartProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :shop_product

  belongs_to :shop_order
end
