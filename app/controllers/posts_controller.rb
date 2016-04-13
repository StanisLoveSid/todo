class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_filter :set_locale
	impressionist actions: [:show], unique: [:session_hash]
    caches_page :show, :new, :upvote, :downvote

    def search
        if params[:search].present?
           @posts = Post.search(params[:search])
        else
           @posts = Post.all
        end
    end

	def index
		
		   if params[:tag].present? 
              @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 6)
           else
              @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    
           end 
		
	end

	def new
          @post = Post.new
	end

	def create
		@user = current_user
		@post = current_user.posts.build(post_params)
	      if @post.save

	      	  PostMailer.post_created(@user).deliver
		      redirect_to @post
	      else
		      render 'new'
	      end
	end
	
	def show
		
		@post = Post.find(params[:id])
		@user = @post.votes_for.up.by_type(User).voters
		
	end

	def user_posts
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(:title, :body, :link, :image, :video, :tag_list))
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
    	respond_to do |format|
    		format.html {redirect_to :back }
    		format.json { render json: { count: @post.get_upvotes.size } }
    	end
    end

    def downvote
    	@post = Post.find(params[:id])
    	@post.downvote_by current_user
    	respond_to do |format|
    		format.html {redirect_to :back }
    		format.json { render json: { count: @post.get_downvotes.size  } }
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





















