class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :set_locale

    def search
        if params[:search].present?
           @posts = Post.search(params[:search])
        else
           @posts = Post.all
        end
    end

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		def new
          @post = Post.new
          
        end
  
	end

	def create
		@post = current_user.posts.build(post_params)
	      if @post.save
		      redirect_to @post
	      else
		      render 'new'
	      end
	end
	
	def show
		@post = Post.find(params[:id])
		
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body))
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

    def upvote
    	@post = Post.find(params[:id])
    	@post.upvote_by current_user
    	redirect_to :back
    end

    def downvote
    	@post = Post.find(params[:id])
    	@post.downvote_by current_user
    	redirect_to :back
    end

	private
	def post_params
		params.require(:post).permit(:title, :body, :id)
	end

end





















