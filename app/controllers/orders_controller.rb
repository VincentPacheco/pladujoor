class OrdersController < ApplicationController
  def index
    @orders = Orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_dishe = OrderDishe.new
    @order_dishes = @order.order_dishes.where(user: current_user)
    authorize @order
  end

  def new
    @order = current_user.orders.new
    authorize @order
  end

  def create
    @order = order.new(order_params)
    authorize @order
    @order.user = current_user
    if @order.save!
      redirect_to order_path(@order)
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
    params.require(:order).permit(:title, :description, :longdescription, :price, :photo, :address, :capacity, :duration)
  end
end
