class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts do |t|
      t.references :category, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
    end
  end
end
