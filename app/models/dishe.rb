class Dishe < ApplicationRecord
  has_many :order_dishes
  has_one :category
  has_one :restaurant
end
