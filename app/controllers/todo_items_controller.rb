class TodoItemsController < ApplicationController
	
	before_action :set_post
	before_action :set_todo_item, except: [:create]

	def create
		@todo_item = @post.todo_items.create(todo_item_params)
		respond_to :js
	end

	def destroy
		if @todo_item.destroy
			flash[:success] = "Todo List item was deleted."
			respond_to do |format|
				format.js
			end
		else
			flash[:error] = "Todo List item could not be deleted."
			respond_to do |format|
				format.js
			end
		end
		
	end

	def complete
		@todo_item.update_attribute(:completed_at, Time.now)
		respond_to :js
	end

	def index
		@todo_items = Todo_item.order("position")
	end

	def edit
		
	end

	 def update
    respond_to do |format|
       @todo_item.update(todo_item_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js
    end
  end
    
  def sort
    render nothing: true
  end
	

	private

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_todo_item
		@todo_item = @post.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content, :deadline)
	end
end
