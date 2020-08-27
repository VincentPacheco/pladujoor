class ChangeNull < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column_null :order, :order_dishe_id, null: true
    end

    def down
      change_column_null :order, :order_dishe_id, null: false
    end
  end
end
