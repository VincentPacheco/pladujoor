class AddReferencesToDishes < ActiveRecord::Migration[6.0]
  def change
    add_reference :dishes, :order_dishe, null: false, foreign_key: true
  end
end
