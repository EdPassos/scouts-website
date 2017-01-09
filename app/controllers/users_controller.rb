class UsersController < ApplicationController
  load_and_authorize_resource
  layout 'admin'

  before_action :set_user, only: [:update, :edit, :roles, :add_role]

  def index
    @users = User.all
    render layout: 'admin'
  end

  def show
    @person = current_user.person
    @person ||= Person.new(user: current_user)
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

  def roles
    @roles = @user.roles
  end

  def add_role
    role = params.require(:user)[:roles]
    @user.add_role role
    redirect_to :back
  end

  def remove_role
    role = params.require(:user)[:roles]
    puts "HEEHEEEEEHEH"
    puts role
    @user.remove_role role
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find params[:id]
  end
end
