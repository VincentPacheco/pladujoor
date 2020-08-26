class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category)
  end
  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @menu = Menu.find(params[:menu_id])
    @category.menu = @menu
    authorize @category
    if @category.save!
      redirect_to restaurant_menu_path(@menu.restaurant, @menu)
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category
    @category.destroy
    redirect_to categorys_path
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end
end
