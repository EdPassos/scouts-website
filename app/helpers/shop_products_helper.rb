module ShopProductsHelper
	def products_in_cart
		nr_of_products = 0
		cart = current_user.shopping_cart_products.where(shop_order: nil)
		
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

	def decimal_to_euro(decimal)
		s = sprintf '%.2f €', decimal
		s.html_safe
	end

	def cart_product_total(cart_product)
		price = cart_product.shop_product.price
		total = price * cart_product.quantity
	end

	def cart_total(cart)
		total = 0
		cart.each do |cart_product|
			total += cart_product_total cart_product
		end
		total
	end
end
