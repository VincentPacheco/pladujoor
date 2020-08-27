class CreateCategoryDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :category_dishes do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
