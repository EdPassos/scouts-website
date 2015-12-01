class CreateShopProducts < ActiveRecord::Migration
  def change
    create_table :shop_products do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps null: false
    end
  end
end
