class RemoveCategorieFromDishes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :dishes, :categorie, null: false, foreign_key: true
  end
end
