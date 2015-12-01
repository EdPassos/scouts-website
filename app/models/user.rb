class User < ActiveRecord::Base
	rolify

	# Shop
	has_many :shopping_cart_products
	has_many :shop_orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_admin
	  user = User.new
	  user.id = 1
	  user.email = "admin@admin.com"
	  user.password = "adminpassword"
	  user.save

	  user.add_role :admin
  end
end
