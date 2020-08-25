class AddCategorieToDishes < ActiveRecord::Migration[6.0]
  def change
    add_reference :dishes, :categorie, null: false, foreign_key: true
  end
end
