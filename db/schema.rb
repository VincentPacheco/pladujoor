# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_25_104313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dishe_id", null: false
    t.index ["dishe_id"], name: "index_categories_on_dishe_id"
    t.index ["menu_id"], name: "index_categories_on_menu_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.text "ingredient"
    t.integer "price"
    t.bigint "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_dishe_id", null: false
    t.index ["menu_id"], name: "index_dishes_on_menu_id"
    t.index ["order_dishe_id"], name: "index_dishes_on_order_dishe_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_menus_on_category_id"
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "order_dishes", force: :cascade do |t|
    t.bigint "dishe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id", null: false
    t.index ["dishe_id"], name: "index_order_dishes_on_dishe_id"
    t.index ["order_id"], name: "index_order_dishes_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "number"
    t.bigint "order_dishe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.index ["order_dishe_id"], name: "index_orders_on_order_dishe_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_id", null: false
    t.bigint "table_id", null: false
    t.index ["menu_id"], name: "index_restaurants_on_menu_id"
    t.index ["table_id"], name: "index_restaurants_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id", null: false
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "dishes", column: "dishe_id"
  add_foreign_key "categories", "menus"
  add_foreign_key "dishes", "menus"
  add_foreign_key "dishes", "order_dishes", column: "order_dishe_id"
  add_foreign_key "menus", "categories"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "order_dishes", "dishes", column: "dishe_id"
  add_foreign_key "order_dishes", "orders"
  add_foreign_key "orders", "order_dishes", column: "order_dishe_id"
  add_foreign_key "restaurants", "menus"
  add_foreign_key "restaurants", "tables"
  add_foreign_key "tables", "restaurants"
end
