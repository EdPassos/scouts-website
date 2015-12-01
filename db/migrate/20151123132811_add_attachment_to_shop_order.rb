class AddAttachmentToShopOrder < ActiveRecord::Migration
  def change
	  add_attachment :shop_orders, :proof
  end
end
