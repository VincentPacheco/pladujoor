class AddOrderDishToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :order_dish, null: false, foreign_key: true
  end
end
