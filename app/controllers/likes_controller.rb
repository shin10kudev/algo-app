class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = current_user.likes
  end

  def create
    @post = Post.find(like_params[:post_id])
    @user = User.find(@post.user_id)

    @like = current_user.likes.build(like_params)
  	if @like.save
      @note = @user.notifications.build(path: "posts/#{@post.id}", action: "liked your post '#{@post.title}'", originator_id: current_user.id, reference_id: @post.id)
      @note.save
      redirect_to(:back)
  	else
  		render 'posts', alert: "Oops! something went wrong..."
  	end
  end

  def destroy
  	@like = current_user.likes.find_by(like_params)
  	if @like.destroy
  	 redirect_to(:back)
    else
      render 'posts', alert: "Oops! something went wrong..."
    end
  end

  private
    def like_params
    	params.require(:like).permit(:post_id)
    end
end
