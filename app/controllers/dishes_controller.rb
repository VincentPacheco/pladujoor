class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @dishes = policy_scope(Dish)
  end

  def show
    @order = Order.find(params[:order_id])
    @table = @order.table
    @dish = Dish.find(params[:id])
    
    @dishe_ids_with_quantity = @order.order_dishes.group(:dish_id).count

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
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = Dish.find(params[:id])
    authorize @dish
  end

  def update
    @dish = Dish.find(params[:id])
    authorize @dish
    @dish.save!
    redirect_to restaurant_dish_path(@dish.restaurant, @dish)
  end

  def destroy
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :ingredient, :price, :photo)
  end
end
