class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :find_order, only: [ :name ]
  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    @orderray = Hash.new(0)
    @order.dishes.each { |dish| @orderray[dish.name] += 1 }
    authorize @order
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.first
    @table = Table.find(params[:table_id])
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new
    @order.table_id = params[:table_id]
    params[:order_dishes].each do |id, qty|
      qty.to_i.times do
        OrderDish.create(dish_id: id, order: @order)
      end
    end
    authorize @order
    if @order.save!
      redirect_to restaurant_table_order_path(@order.table.restaurant, @order.table, @order)
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

  def confirmation
    @order = Order.find(params[:id])
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:number, :status, :description)
  end
end
