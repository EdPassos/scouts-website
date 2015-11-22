class ShopOrdersController < ApplicationController
	def index
	end

	def create
		shop_order = ShopOrder.new
		shopping_cart = current_user.shopping_cart_products
		shop_order.shop_order_status = ShopOrderStatus.find(1) # Espera Pagamento
		shop_order.save
		shopping_cart.each do |order_product|
			order_product.shop_order = shop_order
			order_product.save
		end
		redirect_to :back
	end
end
