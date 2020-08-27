class DeleteReferenceOrderDisheId < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:orders, :order_dishe, index: true, foreign_key: true)
  end
end
