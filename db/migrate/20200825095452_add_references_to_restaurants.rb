class AddReferencesToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_reference :restaurants, :menu, null: false, foreign_key: true
    add_reference :restaurants, :table, null: false, foreign_key: true
  end
end
