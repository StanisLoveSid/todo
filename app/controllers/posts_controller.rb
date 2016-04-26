class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :set_locale
	impressionist actions: [:show], unique: [:session_hash]
    caches_page :new, :upvote, :downvote
    respond_to :js
    def search
        if params[:search].present?
           @posts = Post.search(params[:search])
        else
           @posts = Post.all
        end
    end

	def index
    
		@todo_items = TodoItem.all
		   if params[:tag].present? 
              @posts = Post.tagged_with(params[:tag])
           else
              @posts = Post.all.order("created_at DESC")
    
           end 
       	
	end

	def new
          @post = Post.new
          respond_to :js
	end

	def create
		@user = current_user
		@post = current_user.posts.build(post_params)
	    if @post.save
       
	    respond_with @post
        else
          flash[:error] = "Oops, something went wrong"
        end
	end
	
	def show
		
		@post = Post.find(params[:id])
		@user = @post.votes_for.up.by_type(User).voters
		respond_with @post

	end

	def user_posts
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
		respond_to :js
	end

	def update
		@post = Post.find(params[:id])
	   @post.update(params[:post].permit(:title, :body, :link, :image, :video, :tag_list))
		   
		
		respond_with @post
	end

	def destroy
        if params[:tag].present? 
              @posts = Post.tagged_with(params[:tag])
           else
              @posts = Post.all.order("created_at DESC")
    
           end 
		@post = Post.find(params[:id])
		@post.destroy
    
		respond_to :js
	end

    def upvote
    	@post = Post.find(params[:id])
    	@post.upvote_by current_user
    	respond_to do |format|
    		format.html {redirect_to :back }
    		format.json { render json: { count: @post.get_upvotes.size } }
        format.js 
    	end
    end

    def downvote
    	@post = Post.find(params[:id])
    	@post.downvote_by current_user
    	respond_to do |format|
    		format.html {redirect_to :back }
    		format.json { render json: { count: @post.get_downvotes.size  } }
        format.js
    	end
    end


    

     def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @post
      redirect_to :back, notice: 'You favorited #{@post.name}'

    elsif type == "unfavorite"
      @current_user.favorites.delete(@post)
      redirect_to :back, notice: 'Unfavorited #{@post.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


  def sort
    #render :text => 'sorted'
    params[:id].each_with_index do |id, index|
      Todo_item.update_all(['position=?', index+1], ['id=?', id])
    end
    #render :text => 'sorted'
    render :nothing => true
  end


	private
	def post_params
		params.require(:post).permit(:title, :body, :id, :link, :image, :video, :tag_list)
	end


	def set_todo_item
		@todo_item = @post.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content, :deadline)
	end

end





















