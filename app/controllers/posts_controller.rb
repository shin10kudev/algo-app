class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.search(params[:search])
    @algorithms = Post.limit(5).order("RANDOM()")
    @tags = ["String", "Array", "Linked List", "Sort", "Recursive", "Stacks and Queues", "Binary Search"]
    if current_user
      @users = User.where.not(id: current_user.id).limit(5).order("RANDOM()")
    else
      @users = User.all.limit(5).order("RANDOM()")
    end
  end

  def show
    @comments = @post.comments
    @likes = @post.likes.includes(:user).limit(25)
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
      render 'new', alert: "Oops! Something went wrong..."
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'new', alert: "Oops! Something went wrong..."
    end
  end

  def destroy
    @post.destroy
    redirect_to(:back)
    flash[:notice] = "Your algorithm was deleted!"
  end

  # custom to-sentence method
  # via http://www.rahuljiresal.com/2014/02/a-better-to_sentence-in-rails/
  Array.send(:define_method, "to_sentence_more") do | n, morestring, params={} |
    array = self.take(n)
    remaining = self.drop(n)
    if (remaining.count > 0)
  str = remaining.count.to_s + " " + morestring
  array.push(str)
    end
    array.to_sentence(params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :code, :description, :difficulty, :category)
    end
end
