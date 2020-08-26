class MenusController < ApplicationController
  def index
    @menus = policy_scope(Menu)
  end

  def show
    @menu = Menu.find(params[:id])
    @dishes = Dish.all
    authorize @menu
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new
    authorize @menu
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new(order_params)
    @menu.restaurant = @restaurant
    if @menu.save!
      redirect_to restaurant_menus_path
    authorize @menu
    else
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to orders_path
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.update(order_params)
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:menu).permit(:name)
  end
end
