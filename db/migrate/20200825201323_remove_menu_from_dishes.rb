class RemoveMenuFromDishes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :dishes, :menu, null: false, foreign_key: true
  end
end
