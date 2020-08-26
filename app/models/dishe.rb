class Dishe < ApplicationRecord
  has_many :order_dishes
  belongs_to :category, optional: true
  belongs_to :restaurant, optional: true
end
