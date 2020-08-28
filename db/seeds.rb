require "open-uri"

puts "Destroying the Database..."
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
%w[Starters Dishes Desserts Drinks].each do |cat_name|
  cat = Category.create!(name: cat_name, menu: menu)
  if cat_name == "Starters"
    tomatoe = Dish.create!(name: "Tomatoes & Mozzarella",
       ingredient: "Tomates, Mozzarella ACO 100g, Basilic, Olive oil",
       price: 8,
       category: cat,
       restaurant: restaurant)
    tomatoe.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606071/Pladujoor/tomatesmozza_koyhet.jpg'), filename: 'tomatoe.jpg', content_type: 'image/jpg')


    bruschetta = Dish.create!(name: "Garlic Bruschetta",
      ingredient: "Grilled bread, Tomatoes, Garlic, Basilic, Olive oil",
      price: 7,
      category: cat,
      restaurant: restaurant)
    bruschetta.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606070/Pladujoor/bruschetta_yvpmn2.jpg'), filename: 'bruschetta.jpg', content_type: 'image/jpg')

    burrata = Dish.create!(name: "Burrata & cherry tomatoes",
      ingredient: "Burrata ACO 100g, Cherry tomatoes, Olive oil",
      price: 9,
      category: cat,
      restaurant: restaurant)
    burrata.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606069/Pladujoor/burrata-et-tomates-cerises_dup6ye.jpg'), filename: 'burrata.jpg', content_type: 'image/jpg')


  elsif cat_name == "Dishes"
    arrabiata = Dish.create!(name: "Penne with Arrabiata sauce",
      ingredient: "Penne, Spicy Arrabiata sauce, Parmesan",
      price: 12,
      category: cat,
      restaurant: restaurant)
    arrabiata.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606071/Pladujoor/pennearrabiata_yoe1xb.jpg'), filename: 'arrabiata.jpg', content_type: 'image/jpg')

    lasagna = Dish.create!(name: "Lasagna Bolognese",
      ingredient: "'Home' pasta, Beef, Tomatoes, Carrots, Onions",
      price: 14,
      category: cat,
      restaurant: restaurant)
    lasagna.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606070/Pladujoor/lasagnebolo_yejtfp.jpg'), filename: 'lasagna.jpg', content_type: 'image/jpg')

    risotto = Dish.create!(name: "Mushroom risotto",
      ingredient: "Rice, Mushrooms, Fresh cream",
      price: 13,
      category: cat,
      restaurant: restaurant)
    risotto.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606070/Pladujoor/risottochampi_mbjlw3.jpg'), filename: 'risotto.jpg', content_type: 'image/jpg')


  elsif cat_name == "Desserts"
    tiramisu = Dish.create!(name: "Coffee Tiramisu",
      ingredient: "Eggs, Sugar, Brewed coffee, Milk, Cream, Vanilla extract",
      price: 12,
      category: cat,
      restaurant: restaurant)
    tiramisu.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606070/Pladujoor/tiramisucafe_ijv0oe.jpg'), filename: 'tiramisu.jpg', content_type: 'image/jpg')

    pannacotta = Dish.create!(name: "Panna Cotta",
      ingredient: "Milk, Gelatin, Cream, Sugar, Vanilla beans, Strawberries",
      price: 10,
      category: cat,
      restaurant: restaurant)
    pannacotta.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606070/Pladujoor/pannacotta_swujc4.jpg'), filename: 'pannacotta.jpg', content_type: 'image/jpg')

    cannoli = Dish.create!(name: "Cannoli",
      ingredient: "Flour, Eggs, Sugar, Oil, Vanilla essence, Sour cream, Chocolate, Ricotta cheese",
      price: 12,
      category: cat,
      restaurant: restaurant)
    cannoli.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606069/Pladujoor/cannoli_brbkbf.jpg'), filename: 'cannoli.jpg', content_type: 'image/jpg')


  else
    beer = Dish.create!(name: "Beer",
      ingredient: nil,
      price: 12,
      category: cat,
      restaurant: restaurant)
    beer.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606070/Pladujoor/beer_ct33gn.jpg'), filename: 'beer.jpg', content_type: 'image/jpg')

    soda = Dish.create!(name: "Fruit soda",
      ingredient: nil,
      price: 10,
      category: cat,
      restaurant: restaurant)
    soda.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606071/Pladujoor/soda_tnf3j9.png'), filename: 'soda.jpg', content_type: 'image/png')

    water = Dish.create!(name: "Mineral water",
      ingredient: nil,
      price: 12,
      category: cat,
      restaurant: restaurant)
    water.photo.attach(io: URI.open('https://res.cloudinary.com/ds0cha29d/image/upload/v1598606072/Pladujoor/water_ompxow.jpg'), filename: 'water.jpg', content_type: 'image/jpg')

  end
end

puts "Database created!"
