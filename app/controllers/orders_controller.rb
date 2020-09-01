class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show, :confirmation, :edit, :update ]
  before_action :find_order, only: [ :name ]
  def index
    @orders = policy_scope(Order)
  end

  def new
    # -- PREVIOUS VERSION --

    # @table = Table.find(params[:table_id])
    # @restaurant = @table.restaurant
    # @order = Order.new
    # authorize @order
    # if params[:query].present?
    #   sql_query = "name ILIKE :query OR ingredient ILIKE :query"
    #   @dishes = @restaurant.dishes.where(sql_query, query: "%#{params[:query]}%")
    # else
    #   @menu = @restaurant.menus.first
    # end

    # -- NEW VERSION -- we directly create an order and go to its edit page

    @table = Table.find(params[:table_id])
    @order = Order.new
    @order.table = @table
    authorize @order

    @order.save!

    redirect_to edit_table_order_path(@table, @order)
  end

  # DEPRECATED: we won't use it anymore
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
      @totalprice = @order.order_dishes.reduce(0) { |sum, order_dish| sum + order_dish.dish.price }
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: "Pladujoor",
          images: ["https://res.cloudinary.com/ds0cha29d/image/upload/v1598952947/Pladujoor/1200x_tlhokc.png"],
          amount: @totalprice.fractional,
          currency: 'eur',
          quantity: 1
        }],
        success_url: table_order_url(@order.table, @order),
        cancel_url: edit_table_order_url(@order.table, @order)
      )
      @order.update(checkout_session_id: session.id)
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
    if params[:query].present?
      sql_query = "name ILIKE :query OR ingredient ILIKE :query"
      @dishes = @restaurant.dishes.where(sql_query, query: "%#{params[:query]}%")
    else
      @menu = @restaurant.menus.first
    end
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
    @totalprice = @order.reload.order_dishes.reduce(0) { |sum, order_dish| sum + order_dish.dish.price }

    if @totalprice == 0
      flash[:alert] = "Your cart is empty!"
    else
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Pladujoor",
        images: ["https://res.cloudinary.com/ds0cha29d/image/upload/v1598952947/Pladujoor/1200x_tlhokc.png"],
        amount: @totalprice.fractional,
        currency: 'eur',
        quantity: 1
      }],
      success_url: table_order_url(@order.table, @order),
      cancel_url: edit_table_order_url(@order.table, @order)
    )
    @order.update(checkout_session_id: session.id)
    redirect_to confirmation_table_order_path(@order.table, @order)
    end


  end

  def confirmation
    @order = Order.find(params[:id])
    authorize @order
    @orderdishes = @order.order_dishes
    @dishes = @order.dishes
    @menu_test = Money.new(@dishes.select('id, name, price_cents').sum('price_cents'))

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




