class Dishe < ApplicationRecord
  has_many :order_dishes
<<<<<<< HEAD
  belongs_to :category, optional: true
  belongs_to :restaurant, optional: true
=======
  has_one :category
  has_one :restaurant
>>>>>>> master
end
