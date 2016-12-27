class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = current_user.likes
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(@post.user_id)

    @like = current_user.likes.build(post_id: params[:post_id])

  	if @like.save
      @note = @user.notifications.build(path: "posts/#{@post.id}", action: "liked your post '#{@post.title}'", originator_id: current_user.id, reference_id: @post.id)
      @note.save

      redirect_to(:back)
  	else
  		flash[:alert] = "Oops! Something went wrong..."
      redirect_to(:back)
  	end
  end

  def destroy
  	@like = current_user.likes.find_by(post_id: params[:id])

  	if @like.destroy
  	 redirect_to(:back)
    else
      flash[:alert] = "Oops! Something went wrong..."
      redirect_to(:back)
    end
  end

end
