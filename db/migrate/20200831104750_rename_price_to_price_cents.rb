class RenamePriceToPriceCents < ActiveRecord::Migration[6.0]
  def change
    rename_column :dishes, :price, :price_cents
  end
end
