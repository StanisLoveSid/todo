class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]



  # POST /comments
  # POST /comments.json

 def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json 
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  else
    respond_to do |format|
   format.html {redirect_to posts_url, notice: 'You have to sign in or sign up to leave comments'}
   end
  end

  end

  def update
    
    @comment.update(params[:comment].permit(:post_id, :body, :user_id))
      if @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json 
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  else
    respond_to do |format|
   format.html {redirect_to posts_url, notice: 'You have to sign in or sign up to leave comments'}
   end
  end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy

    @comments = Comment.find_with_reputation(:votes, :all, order: "votes desc")
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

 def index
  @comments = Comment.find_with_reputation(:votes, :all, order: "votes desc")
 end

def vote
  if @user = current_user
  value = params[:type] == "up" ? 1 : -1
  @comment = Comment.find(params[:id])
  @comment.add_or_update_evaluation(:votes, value, current_user)
  redirect_to :back, notice: "Thank you for voting"

else
  respond_to do |format|
   format.html {redirect_to posts_url, notice: 'You have to sign in or sign up to leave your votes'}
   end
  end
end

  def download_file
    @comment = Comment.find(params[:id])
    send_file(@comment.file.path,
          :filename => @comment.file.name,
          :type => @comment.file.content_type,
          :disposition => 'attachment',
          :url_based_filename => true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id, :image, :video, :document)
    end
end
