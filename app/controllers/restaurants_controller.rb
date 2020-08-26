class RestaurantsController < ApplicationController
  def index
    @restaurants = policy_scope(Restaurant)
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
    @user = current_user
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = @user.id
    authorize @restaurant
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant)
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
