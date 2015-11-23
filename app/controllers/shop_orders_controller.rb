class ShopOrdersController < ApplicationController
	before_action :set_shop_order, only: [:show, :update]
	def user_index
		@shop_orders = current_user.shop_orders
		render :index
	end

	def index
		@shop_orders = ShopOrder.all
	end

	def show
	end

	def create
		shop_order = current_user.shop_orders.new
		shopping_cart = current_user.shopping_cart_products.where(shop_order: nil)
		shop_order.shop_order_status = ShopOrderStatus.find(1) # Espera Pagamento
		shop_order.save
		shopping_cart.each do |order_product|
			order_product.shop_order = shop_order
			order_product.save
		end
		redirect_to shop_order
	end

	def update
		@shop_order.update(shop_order_params)
		redirect_to @shop_order
	end

	private
	def set_shop_order
		@shop_order = ShopOrder.find params[:id]
	end

	def shop_order_params
		params.require(:shop_order).permit(:proof)
	end
end
