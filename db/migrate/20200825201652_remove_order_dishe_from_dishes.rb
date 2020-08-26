class RemoveOrderDisheFromDishes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :dishes, :order_dishe, null: false, foreign_key: true
  end
end
