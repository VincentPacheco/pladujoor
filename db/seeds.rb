puts "Star destroying the Database..."
Order.destroy_all
puts "Orders destroyed!"
Dish.destroy_all
puts "Dishes destroyed!"
Category.destroy_all
puts "Categories destroyed!"
Menu.destroy_all
puts "Menus destroyed!"
Table.destroy_all
puts "Tables destroyed!"
Restaurant.destroy_all
puts "Restaurants destroyed!"
User.destroy_all
puts "Users destroyed!"
puts "Everything is destroyed."
puts "Now creating Database..."


admin = User.create!(email: "boss1@test.com", password: "123123")

restaurant = Restaurant.create!(name: "Presto Fresco", user: admin)
table = Table.create!(number: 7, restaurant: restaurant)
menu = Menu.create!(restaurant: restaurant, name: "Summer Menu")
%w[Starters Dishes Desserts].each do |cat_name|
  cat = Category.create!(name: cat_name, menu: menu)
  if cat_name == "Starters"
    Dish.create!(name: "Tomatoes & Mozzarella", ingredient: "Tomates, Mozzarella ACO 100g, Basilic, Olive oil", price: 8, category: cat, restaurant: restaurant)
    Dish.create!(name: "Garlic Bruschetta", ingredient: "Grilled bread, Tomatoes, Garlic, Basilic, Olive oil", price: 7, category: cat, restaurant: restaurant)
    Dish.create!(name: "Burrata & cherry tomatoes", ingredient: "Burrata ACO 100g, Cherry tomatoes, Olive oil", price: 9, category: cat, restaurant: restaurant)
  elsif cat_name == "Dishes"
    Dish.create!(name: "Penne with Arrabiata sauce", ingredient: "Penne, Spicy Arrabiata sauce, Parmesan", price: 12, category: cat, restaurant: restaurant)
    Dish.create!(name: "Lasagna Bolognese", ingredient: "'Home' pasta, Beef, Tomatoes, Carrots, Onions", price: 14, category: cat, restaurant: restaurant)
    Dish.create!(name: "Mushroom risotto", ingredient: "Rice, Mushrooms, Fresh cream", price: 13, category: cat, restaurant: restaurant)
  elsif cat_name == "Desserts"
    Dish.create!(name: "Coffee Tiramisu", ingredient: "Eggs, Sugar, Brewed coffee, Milk, Cream, Vanilla extract", price: 12, category: cat, restaurant: restaurant)
    Dish.create!(name: "Panna Cotta", ingredient: "Milk, Gelatin, Cream, Sugar, Vanilla beans, Strawberries", price: 10, category: cat, restaurant: restaurant)
    Dish.create!(name: "Cannoli", ingredient: "Flour, Eggs, Sugar, Oil, Vanilla essence, Sour cream, Chocolate, Ricotta cheese", price: 12, category: cat, restaurant: restaurant)
  else
    Dish.create!(name: "Beer", ingredient: nil, price: 12, category: cat, restaurant: restaurant)
    Dish.create!(name: "Fruit soda", ingredient: nil, price: 10, category: cat, restaurant: restaurant)
    Dish.create!(name: "Mineral water", ingredient: nil, price: 12, category: cat, restaurant: restaurant)
  end
end

puts "Database created!"
