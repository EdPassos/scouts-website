class AddPublicToSection < ActiveRecord::Migration
  def change
    add_column :sections, :public, :boolean
  end
end
