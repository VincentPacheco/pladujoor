class AddReferencesToMenus < ActiveRecord::Migration[6.0]
  def change
    add_reference :menus, :category, null: false, foreign_key: true
  end
end
