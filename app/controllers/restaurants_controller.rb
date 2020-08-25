class RestaurantsController < ApplicationController
  def index
    @Restaurants = policy_scope(Restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    if @restaurant.save!
      render restaurant_path(@restaurant)
    else
      render "new"
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
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end
