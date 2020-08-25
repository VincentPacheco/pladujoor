class RemoveMenuFromRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :restaurants, :menu, null: false, foreign_key: true
  end
end
