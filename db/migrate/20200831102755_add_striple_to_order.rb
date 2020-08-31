class AddStripleToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :state, :string
    add_column :orders, :amount, :integer
    add_column :orders, :checkout_session_id, :string
  end
end
