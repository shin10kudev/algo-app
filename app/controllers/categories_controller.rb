class CategoriesController < ApplicationController
  before_action :check_user_role
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category successfully created!"
      redirect_to categories_path
    else
      flash[:error] = "Oops! Something went wrong... Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category successfully updated!"
      redirect_to categories_path
    else
      flash[:alert] = "Oops! Something went wrong... Please try again."
      render 'new'
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Category was deleted!"
      redirect_to categories_path
    else
      flash[:alert] = "Category in use. Category cannot be deleted!"
      redirect_to categories_path
    end
  end

  def check_user_role
    if !current_user.admin?
      flash[:error] = "You need to be an admin to access this feature"
      redirect_to(:back)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
end
