class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
    authorize @table
  end

  def new
    @table = Table.new
    authorize @table
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.new(table_params)
    @table.restaurant = @restaurant
    if @table.save!
      render tables_path
    else
      render 'new'
    end
  end

  def destroy
    @table = Table.find(params[:id])
    authorize @table
    @table.destroy
    redirect_to tables_path
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
