class TagpagesController < ApplicationController

	before_filter :set_locale
	



	def index
		   if params[:tag].present? 
              @posts = Post.tagged_with(params[:tag])
           else
              @posts = Post.all.order("created_at DESC")
           end 
		
	end

	
	def show
		@post = Post.find(params[:id])
		
	end

	def user_posts
		@post = Post.find(params[:id])
	end


	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body, :image, :tag_list))
		   redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy

		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end


	private
	def post_params
		params.require(:post).permit(:title, :body, :id, :image, :tag_list)
	end

end
























