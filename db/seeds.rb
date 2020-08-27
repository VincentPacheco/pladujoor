Order.destroy_all
Dish.destroy_all
Category.destroy_all
Menu.destroy_all
Table.destroy_all
Restaurant.destroy_all
User.destroy_all

admin = User.create!(email: "boss1@test.com", password: "123123")

restaurant = Restaurant.create!(name: "La Tour d'Argent", user: admin)
table = Table.create!(number: 7, restaurant: restaurant)
menu = Menu.create!(restaurant: restaurant, name: "Summer Menu")
%w[Starters Dishes Desserts].each do |cat_name|
  cat = Category.create!(name: cat_name, menu: menu)
  if cat_name == "Starters"
    Dish.create!(name: "Tomate Mozza", ingredient: "Tomates, Mozzarela", price: 8, category: cat, restaurant: restaurant)
    Dish.create!(name: "Sardines", ingredient: "Tomates, Mozzarela", price: 10, category: cat, restaurant: restaurant)
  elsif cat_name == "Dishes"
    Dish.create!(name: "Poulet Basquaise", ingredient: "Du poulet", price: 20, category: cat, restaurant: restaurant)
    Dish.create!(name: "Pizza", ingredient: "Tomates, Mozzarela, Olives", price: 14, category: cat, restaurant: restaurant)
  else 
    Dish.create!(name: "Pannacota", ingredient: "Creme et coulis", price: 12, category: cat, restaurant: restaurant)
    Dish.create!(name: "Tirramisu", ingredient: "Cafê", price: 10, category: cat, restaurant: restaurant)
  end
end
