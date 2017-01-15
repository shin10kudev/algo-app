class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    if params[:category_id]
      @posts = @posts.where(category_id: params[:category_id])
    end
  end
end
