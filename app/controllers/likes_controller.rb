class LikesController < ApplicationController
  before_action :authenticate_user!

  def favorites
    @likes = current_user.likes
  end

  def create
    @post = Post.find(params[:id])
    @like = current_user.likes.build(post_id: @post.id)

  	if @like.save
      redirect_to :back
  	else
  		flash[:alert] = "Oops! Something went wrong... Please try again"
      redirect_to :back
  	end
  end

  def destroy
    @post = Post.find(params[:id])
  	@like = current_user.likes.find_by(post_id: @post.id)

  	if @like.destroy
  	 redirect_to :back
    else
      flash[:alert] = "Oops! Something went wrong... Please try again"
      redirect_to :back
    end
  end

end
