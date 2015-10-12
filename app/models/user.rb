class User < ActiveRecord::Base
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
  end
end
