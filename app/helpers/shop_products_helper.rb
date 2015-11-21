module ShopProductsHelper
	def products_in_cart
		nr_of_products = 0
		cart = current_user.shopping_cart_products
		
		cart.each do |cart_product|
			nr_of_products += cart_product.quantity
		end

		nr_of_products
	end

	def cart_menu_string
		nr_of_products = products_in_cart
		menu_string = "Carrinho"
		unless nr_of_products == 0
			menu_string += " ( #{nr_of_products} )"
		end
		menu_string
	end
end
