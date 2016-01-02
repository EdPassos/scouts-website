class AdminController < ApplicationController
	def users
		@users = User.all
	end

	def posts
		@posts = Post.all
	end

end
