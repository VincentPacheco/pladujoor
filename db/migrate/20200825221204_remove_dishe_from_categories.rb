class RemoveDisheFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_reference :categories, :dishe, null: false, foreign_key: true
  end
end
