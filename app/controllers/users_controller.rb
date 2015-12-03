class UsersController < ApplicationController
	load_and_authorize_resource

	before_action :set_user, only: [:update, :edit]

	def index
		@users = User.all
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to edit_user_path(@user)
		else
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

	def set_user
		@user = User.find params[:id]
	end
end
