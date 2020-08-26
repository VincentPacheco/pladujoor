class RemoveCategoryFromMenus < ActiveRecord::Migration[6.0]
  def change
    remove_reference :menus, :category, null: false, foreign_key: true
  end
end
