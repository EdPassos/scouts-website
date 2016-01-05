class AdminController < ApplicationController
	def users
		@users = User.all
	end

	def people
		@people = Person.all
	end

	def posts
		@posts = Post.all
	end

end
