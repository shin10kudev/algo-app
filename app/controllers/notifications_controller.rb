class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@notes = current_user.notifications.limit(25).order(created_at: "DESC")
  end

  def update
  	@note = current_user.notifications.find(params[:id])
  	@note.update(viewed: true)
  	redirect_to :back
  end

	def destroy
		@note = current_user.notifications.find_by(note_params)
		if @note.destroy
		 redirect_to :back
	  else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
	  end
	end

	private
    def note_params
    	params.require(:note).permit(:id)
    end
end
