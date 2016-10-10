class AdminController < ApplicationController

  def index
  end

  def users
    @users = User.all
  end

  def people
    @people = Person.all
  end

  def posts
    @posts = Post.all
  end

  def categories
    @categories = Category.all
  end
end
