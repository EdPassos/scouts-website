class BlogController < ApplicationController

  def index
    @posts = Post.where(draft: false).paginate(:page => params[:page], :per_page => 5).order(published_at: :desc)
    render layout: 'application'
  end

  def post
    @post = Post.find params[:id]
  end

end
