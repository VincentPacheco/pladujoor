class DishesController < ApplicationController
  def index
    @dishes = policy_scope(Dish)
  end

  def show
    @dishe = Dish.find(params[:id])
    authorize @dishe
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @menu != nil
      @menu = Menu.find(params[:menu_id])
    end
    if @category != nil
      @category = Category.find(params[:category_id])
    end
    @dishe = Dish.new
    authorize @dishe
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @menu != nil
      @menu = Menu.find(params[:menu_id])
    end
    @dishe = Dish.new(dishe_params)
    @category = Category.find(1).id
    @dishe.category_id = @category
    @dishe.restaurant = @restaurant
    authorize @dishe
    if @dishe.save!
      redirect_to restaurant_dishes_path
    else
      render "new"
    end
  end

  def edit
    @dishe = Dish.find(params[:id])
    authorize @dishe
  end

  def update
    @dishe = Dish.find(params[:id])
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
