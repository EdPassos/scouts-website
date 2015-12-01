class ShopOrdersController < ApplicationController
	before_action :set_shop_order, only: [:show, :update, :verify_payment, :ready, :finalize]
	def user_index
		@shop_orders = current_user.shop_orders
		render :index
	end

	def verify_payment
		if @shop_order.shop_order_status_id == 2
			@shop_order.shop_order_status_id = 3
			@shop_order.save
			redirect_to @shop_order, notice: "Pagamento Verificado"
		else
			redirect_to @shop_order, notice: "Falta upload de prova de pagamento"
		end
	end

	def ready
		if @shop_order.shop_order_status_id == 3
			@shop_order.shop_order_status_id = 4
			@shop_order.save
		end
		redirect_to @shop_order, notice: "Encomenda marcada como pronta a levantar"
	end

	def finalize
		if @shop_order.shop_order_status_id == 4
			@shop_order.shop_order_status_id = 5
			@shop_order.save
		end
		redirect_to @shop_order, notice: "Encomanda Entregue e finalizada"
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
		status = @shop_order.shop_order_status
		if @shop_order.update(shop_order_params)
			if @shop_order.proof? and status.id == 1 # Espera Pagamento
				@shop_order.shop_order_status_id = 2 # Espera Verificacao
				@shop_order.save
			end
		end
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
