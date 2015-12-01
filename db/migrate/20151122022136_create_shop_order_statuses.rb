class CreateShopOrderStatuses < ActiveRecord::Migration
  def change
    create_table :shop_order_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
