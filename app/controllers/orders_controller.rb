class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show, :confirmation, :edit, :update ]
  before_action :find_order, only: [ :name ]
  def index
    @orders = policy_scope(Order)
  end

  def new
    @table = Table.find(params[:table_id])
    @restaurant = @table.restaurant
    @menu = @restaurant.menus.first
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
      redirect_to confirmation_table_order_path(@order.table, @order)
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
    @table = @order.table
    @restaurant = @table.restaurant
    @menu = @restaurant.menus.first
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.order_dishes.destroy_all
    params[:order_dishes].each do |id, qty|
      qty.to_i.times do
        OrderDish.create(dish_id: id, order: @order)
      end
    end
    redirect_to confirmation_table_order_path(@order.table, @order)
  end

  def confirmation
    @order = Order.find(params[:id])
    @orderdishes = @order.order_dishes
    # @dishes = Dish.find(@orderdishes).group(:dish_id).order('dish_id asc')
    @dishes = @order.dishes
    authorize @order
  end

  def show
    @order = Order.find(params[:id])

    @priced_order = @order.order_dishes
                          .group_by { |order_dish| order_dish.dish.name }
                          .map do |name, order_dishes|
                            [order_dishes.count, name, order_dishes.reduce(0) { |sum, order_dish| sum + order_dish.dish.price }]
                          end

    @totalprice = @order.order_dishes.reduce(0) { |sum, order_dish| sum + order_dish.dish.price }
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:number, :status, :description)
  end
end




