class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    @order_dishe = OrderDishe.new
    @order_dishes = @order.order_dishes.where(user: current_user)
    authorize @order
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @table = Table.find(params[:table_id])
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    # @order.order_dishes = @order_dishes
    @order.table_id = params[:table_id]
    authorize @order
    if @order.save!
      redirect_to tables_path(@order)
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
    params.require(:order).permit(:number, :status, :description)
  end
end
