class CreateOrderDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :order_dishes do |t|
      t.references :dishe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
