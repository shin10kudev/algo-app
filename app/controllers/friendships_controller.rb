class FriendshipsController < ApplicationController
	before_action :authenticate_user!

  def following
    @friends = current_user.friends
  end

  def followers
    @followers = current_user.inverse_friends
  end

  def create
    @user = User.find(params[:friend_id])

    @friendship = current_user.friendships.build(friend_id: params[:friend_id])

  	if @friendship.save
      @note = @user.notifications.build(path: "users/#{current_user.id}", action: "followed you", originator_id: current_user.id, reference_id: current_user.id)
      @note.save
  		redirect_to(:back)
  	else
  		render @user, alert: "Oops! something went wrong..."
  	end
  end

  def destroy
    @user = User.find(params[:id])

  	@friendship = current_user.friendships.find_by(friend_id: params[:id])

  	if @friendship.destroy
  		redirect_to(:back)
  	else
  		render @user, alert: "Oops! something went wrong..."
  	end
  end
end
