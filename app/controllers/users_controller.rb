class UsersController < ApplicationController
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def edit
		@user = User.find params[:id]
	end
end
