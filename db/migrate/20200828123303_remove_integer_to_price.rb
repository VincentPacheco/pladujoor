class RemoveIntegerToPrice < ActiveRecord::Migration[6.0]
  def change
    remove_column :dishes, :price
  end
end
