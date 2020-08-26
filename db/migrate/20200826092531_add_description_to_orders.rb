class AddDescriptionToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :description, :text
  end
end
