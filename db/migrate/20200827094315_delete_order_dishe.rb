class DeleteOrderDishe < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:orders, :order_dish, index: true, foreign_key: true)
  end
end
