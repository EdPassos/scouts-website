class ShopOrder < ActiveRecord::Base
  belongs_to :shop_order_status
end
