class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:update, :destroy]

  def index
  	@notes = current_user.notifications.order(created_at: "DESC").page(params[:page])
  end

  def update
  	@note.update(viewed: true)
  	redirect_to :back
  end

	def destroy
		if @note.destroy
		 redirect_to :back
	  else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to :back
	  end
	end

  private
    def set_note
      @note = current_user.notifications.find_by(params[:id])
    end
end
