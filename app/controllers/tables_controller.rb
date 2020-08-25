class TablesController < ApplicationController
  def index
  znd
  
  def show
    @restaurant = Restaurant.find(params[:id])
    @order = Order.new
    @orders = @restaurant.orders.where(user: current_user)
    authorize @restaurant
  end

  def new
    @restaurant = current_user.restaurants.new
    authorize @restaurant
  end

  def create
    @restaurant = restaurant.new(restaurant_params)
    authorize @restaurant
    @restaurant.user = current_user
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.update(restaurant_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:title, :description, :longdescription, :price, :photo, :address, :capacity, :duration)
  end