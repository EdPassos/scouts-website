class AdminController < ApplicationController
	def users
		@users = User.all
	end

	def posts
		@posts = Post.all
	end

	def post_show
		@post = Post.find params[:id]
	end
end
