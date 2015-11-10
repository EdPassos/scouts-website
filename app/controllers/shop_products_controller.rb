class ShopProductsController < ApplicationController
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

	def destroy
		@shop_product = ShopProduct.find params[:id]
		@shop_product.destroy
		redirect_to shop_path
	end

	private
	def shop_product_params
		params.require(:shop_product).permit(:name, :description, :price)
	end
end
