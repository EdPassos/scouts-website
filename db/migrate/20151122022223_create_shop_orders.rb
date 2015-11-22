class CreateShopOrders < ActiveRecord::Migration
  def change
    create_table :shop_orders do |t|
      t.references :shop_order_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
