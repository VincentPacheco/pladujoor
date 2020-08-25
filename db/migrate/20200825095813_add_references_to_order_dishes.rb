class AddReferencesToOrderDishes < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_dishes, :order, null: false, foreign_key: true
  end
end
