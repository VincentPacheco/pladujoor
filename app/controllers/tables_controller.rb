class TablesController < ApplicationController
  def index
    @tables = policy_scope(Table)
    @table = Table.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def show
    @table = Table.find(params[:id])
    @orders = @table.orders
    authorize @table
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.new
    authorize @table
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    x = 1
      while Table.find_by(number: x) != nil do
      x += 1
      end
    @table = Table.new(number: x)
    # @table = Table.new(table_params)
    @table.restaurant = current_user.restaurants.first
    authorize @table
    if @table.save!
      redirect_to restaurant_table_path(@table.restaurant, @table)
    else
      render 'new'
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @restaurant = @table.restaurant
    @table.destroy
    authorize @table
    redirect_to restaurant_tables_path(@restaurant)
  end

  def edit
    @table = Table.find(params[:id])
    authorize @table
  end

  def update
      @table = Table.find(params[:id])
    @table.save
    redirect_to table_path(@table)
  end

  private

  def table_params
    params.require(:table).permit(:number)
  end
end
