class FriendshipsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_friend, only: [:create, :destroy]

  def following
    @friends = current_user.friends
  end

  def followers
    @followers = current_user.inverse_friends
  end

  def create
    @friendship = current_user.friendships.build(friend_id: @friend.id)

  	if @friendship.save
      redirect_to :back
  	else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
  	end
  end

  def destroy
  	@friendship = current_user.friendships.find_by(friend_id: @friend.id)

  	if @friendship.destroy
  		redirect_to :back
  	else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
  	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = User.find(params[:id])
    end

end
