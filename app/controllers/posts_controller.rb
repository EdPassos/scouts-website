class PostsController < ApplicationController
  load_and_authorize_resource
  layout 'admin'

  before_action :set_post, only: [:show, :edit, :update]

  def blog
    @posts = Post.where(draft: false).paginate(:page => params[:page], :per_page => 5).order(published_at: :desc)
  end

  def index
    @posts = Post.where(draft: false).paginate(:page => params[:page], :per_page => 5)
  end

  def draft
    @posts = Post.where(draft: true).paginate(:page => params[:page], :per_page => 5)
    render :index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.published_at = @post.created_at
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
