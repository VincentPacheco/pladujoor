class DishesController < ApplicationController
  def index
    @dishes = policy_scope(Dishe)
  end

  def show
    @dishe = Dishe.find(params[:id])
    authorize @dishe
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @category = Category.find(params[:category_id])
    @dishe = Dishe.new
    authorize @dishe
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.find(params[:menu_id])
    @dishe = Dishe.new(dishe_params)
    @category = Category.find(params[:category_id])
    @dishe.category = @category
    authorize @dishe
    if @dishe.save!
      redirect_to restaurant_menu_category_dishes_path
    else
      render "new"
    end
  end

  def edit
    @dishe = Dishe.find(params[:id])
    authorize @dishe
  end

  def update
    @dishe = Dishe.find(params[:id])
    @dishe.save
    redirect_to dishe_path(@dishe)
  end

  def destroy
  end

  private

  def dishe_params
    params.require(:dishe).permit( :name, :ingredient, :price)
  end
end
