class AddReferencesToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :dishe, null: false, foreign_key: true
  end
end
