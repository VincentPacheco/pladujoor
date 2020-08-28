class AddPriceToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :price, :float
  end
end
