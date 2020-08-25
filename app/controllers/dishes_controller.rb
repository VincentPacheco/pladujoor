class DishesController < ApplicationController
  def index
    @dishes = Dishe.all
  end

  def show
    @dishe = Dishe.find(params[:id])
    authorize @dishe
  end

  def new
    @dishe = Dishe.new
    authorize @dishe
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @dishe = Dishe.new(dishe_params)
    @dishe.menu = @menu
    authorize @dishe
    if @dishe.save
      render dishe_path(@dishe)
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
