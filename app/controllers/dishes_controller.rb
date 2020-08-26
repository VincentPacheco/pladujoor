class DishesController < ApplicationController
  def index
    @dishes = policy_scope(Dish)
  end

  def show
    @dish = Dish.find(params[:id])
    authorize @dish
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @menu != nil
      @menu = Menu.find(params[:menu_id])
    end
    if @category != nil
      @category = Category.find(params[:category_id])
    end
    authorize @dish
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    if @menu != nil
      @menu = Menu.find(params[:menu_id])
    end
    @dish = Dish.new(dish_params)
    @category = Category.find(1).id
    @dish.category_id = @category
    @dish.restaurant = @restaurant
    authorize @dish
    if @dish.save!
      redirect_to restaurant_dishes_path
    else
      render "new"
    end
  end

  def edit
    @dish = Dish.find(params[:id])
    authorize @dish
  end

  def update
    @dish = Dish.find(params[:id])
    @dishe.save
    redirect_to dish_path(@dish)
  end

  def destroy
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :ingredient, :price)
  end
end
