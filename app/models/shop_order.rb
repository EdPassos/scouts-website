class ShopOrder < ActiveRecord::Base
	has_attached_file :proof, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :proof, content_type: /\Aimage\/.*\Z/

  belongs_to :shop_order_status
  has_many :products, class_name: 'ShoppingCartProduct'
  #has_many :products, foreign_key: 'id', class_name: 'ShoppingCartProduct'
end
