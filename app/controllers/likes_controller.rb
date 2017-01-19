class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def favorites
    @likes = current_user.likes
  end

  def create
    @like = current_user.likes.build(post_id: @post.id)

  	if @like.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

end
