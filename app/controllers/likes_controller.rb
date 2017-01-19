class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:index]

  def index
    @likes = current_user.likes
  end

  def create
    @user = User.find(@post.user_id)
    @like = current_user.likes.build(post_id: @post.id)

  	if @like.save
      @note = @user.notifications.build(path: "posts/#{@post.id}", action: "liked your post '#{@post.title}'", originator_id: current_user.id, reference_id: @post.id)
      @note.save
      redirect_to :back
  	else
  		flash[:alert] = "Oops! Something went wrong... Please try again"
      redirect_to :back
  	end
  end

  def destroy
  	@like = current_user.likes.find_by(post_id: @post.id)

  	if @like.destroy
  	 redirect_to :back
    else
      flash[:alert] = "Oops! Something went wrong... Please try again"
      redirect_to :back
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
