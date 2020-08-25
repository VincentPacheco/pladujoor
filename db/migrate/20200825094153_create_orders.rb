class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :number
      t.references :order_dishe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
