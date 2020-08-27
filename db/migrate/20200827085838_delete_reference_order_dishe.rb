class DeleteReferenceOrderDishe < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:order_dishes, :dishe, index: true, foreign_key: true)
  end
end
