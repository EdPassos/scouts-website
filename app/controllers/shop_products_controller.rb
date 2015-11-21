class ShopProductsController < ApplicationController
	before_action :set_shop_product, only: [:edit, :update, :destroy, :add_to_cart]
	before_action :authenticate_user!, only: [:add_to_cart]

	def index
		@shop_products = ShopProduct.all
	end

	def new
		@shop_product = ShopProduct.new
	end

	def create
		@shop_product = ShopProduct.new(shop_product_params)
		if @shop_product.save
			redirect_to shop_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @shop_product.update shop_product_params
			redirect_to shop_path
		else
			render :edit
		end
	end

	def destroy
		@shop_product.destroy
		redirect_to shop_path
	end

	def add_to_cart
		cart_product = current_user.shopping_cart_products.find_by(shop_product: @shop_product)
		if cart_product == nil
			# Product wasn't added to the cart
			cart_product = current_user.shopping_cart_products.new
			cart_product.shop_product = @shop_product
			cart_product.quantity = 1
		else
			cart_product.quantity = cart_product.quantity + 1
		end
		cart_product.save
		redirect_to :back, notice: @shop_product.name + ' adicionado ao carrinho'
	end

	private
	def shop_product_params
		params.require(:shop_product).permit(:name, :description, :price, :photo)
	end

	def set_shop_product
		@shop_product = ShopProduct.find params[:id]
	end
end
