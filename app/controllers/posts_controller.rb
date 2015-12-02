class PostsController < ApplicationController
	load_and_authorize_resource

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find params[:id]
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

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
