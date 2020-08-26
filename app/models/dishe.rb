class Dishe < ApplicationRecord
  has_many :order_dishes
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :category, optional: true
  belongs_to :restaurant, optional: true
=======
  has_one :category
  has_one :restaurant
>>>>>>> master
=======
  belongs_to :category, optional: true
  belongs_to :restaurant, optional: true
>>>>>>> 4992a102a6b7fd24427da24b41d6e73f9be2a2db
end
