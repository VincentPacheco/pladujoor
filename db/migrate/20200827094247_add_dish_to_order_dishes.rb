class AddDishToOrderDishes < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_dishes, :dish, null: false, foreign_key: true
  end
end
