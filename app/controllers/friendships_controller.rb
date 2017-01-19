class FriendshipsController < ApplicationController
	before_action :authenticate_user!

  def following
    @friends = current_user.friends
  end

  def followers
    @followers = current_user.inverse_friends
  end

  def create
    @friend = User.find(params[:id])
    @friendship = current_user.friendships.build(friend_id: @friend.id)

  	if @friendship.save
      redirect_to :back
  	else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
  	end
  end

  def destroy
    @friend = User.find(params[:id])
  	@friendship = current_user.friendships.find_by(friend_id: @friend.id)

  	if @friendship.destroy
  		redirect_to :back
  	else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
  	end
  end
end
