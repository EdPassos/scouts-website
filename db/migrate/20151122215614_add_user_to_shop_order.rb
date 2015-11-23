class AddUserToShopOrder < ActiveRecord::Migration
  def change
    add_reference :shop_orders, :user, index: true, foreign_key: true
  end
end
