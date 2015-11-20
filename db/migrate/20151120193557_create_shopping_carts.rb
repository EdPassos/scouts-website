class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :shop_product, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
