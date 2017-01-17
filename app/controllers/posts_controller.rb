class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: "DESC").page(params[:page])

    if params[:search]
      @posts = Post.search(params[:search]).page(params[:page])
    end

    if params[:category_id]
      @posts = @posts.where(category_id: params[:category_id]).page(params[:page])
    end

    if params[:difficulty_level]
      @posts = @posts.where(difficulty: params[:difficulty_level]).page(params[:page])
    end

    # discover new users
    if current_user
      @users = User.where.not(id: current_user.id).limit(5).order("RANDOM()")
    else
      @users = User.all.limit(5).order("RANDOM()")
    end
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Your algorithm was added!"
    else
      flash[:alert] = "Oops! Something went wrong..."
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Your algorithm was updated!"
    else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      render 'new'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Your algorithm was deleted!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      redirect_to(:back)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :code, :description, :difficulty, :category_id)
    end
end
