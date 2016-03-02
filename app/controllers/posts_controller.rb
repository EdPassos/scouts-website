class PostsController < ApplicationController
  load_and_authorize_resource

  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.where(draft: false)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "Artigo '#{@post.title}' publicado"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:draft, :image, :title, :body, { category_ids: [] } )
  end

  def set_post
    @post = Post.find params[:id]
  end
end
