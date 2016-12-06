class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@post = Post.find(comment_params[:post_id])
    @user = User.find(@post.user_id)
    
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      if @post.user_id != current_user.id
        @note = @user.notifications.build(path: "posts/#{@post.id}/#comments", action: "commented on your post '#{@post.title}'", originator_id: current_user.id, reference_id: @post.id)
        @note.save
        flash[:notice] = "Comment added!"
        redirect_to(:back)
      else
      flash[:notice] = "Comment added!"
      redirect_to(:back)
    end
    else
      redirect_to(:back)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    if @comment.user_id == current_user.id || @post.user_id == current_user.id
      @comment.destroy 
      flash[:notice] = "Comment deleted!"
      redirect_to "/posts/#{@comment.post_id}"
    else
      flash[:alert] = "You cannot delete this comment"
      redirect_to(:back)
    end
  end

  private
    def comment_params
      params.require(:post).permit(:body, :post_id)
    end
end
