class TodoItemsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:sort]
	before_action :set_post
	before_action :set_todo_item, except: [:create, :sort]
	
	respond_to :js, :html

	def create
	    @todo_item = @post.todo_items.create(todo_item_params)
		respond_to :js
        if @todo_item.save
           flash[:success] = "Todo item is successfully created"
		else
			flash[:error] = "Todo List item could not be created"
			respond_to :js
		end
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
		@todo_items = TodoItem.order("position")
		respond_with @todo_items
	end

	def edit
		respond_with @todo_item
	end

	def new
		@todo_item = @post.todo_items.create(todo_item_params)
	end

	 def update
      @todo_item.update(todo_item_params)
      respond_with @todo_item
     end
    
  def sort
  	params[:todo_item].each_with_index do |id, index|
      TodoItem.where(id: id).update_all({position: index+1})
    end
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
		params[:todo_item].permit(:content, :deadline, :position)
	end
end
