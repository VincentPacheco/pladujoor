class Dish < ApplicationRecord
  has_many :order_dishes
  has_many :orders, through: :order_dishes
  belongs_to :category, optional: true
  belongs_to :restaurant, optional: true
  has_many :category_dishes
end
