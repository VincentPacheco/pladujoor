class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  def new
    @category = current_user.categorys.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @category.menu = @menu
    authorize @category
    @category.user = current_user
    if @category.save!
      redirect_to category_path(@category)
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
