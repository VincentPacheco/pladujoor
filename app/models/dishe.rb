class Dishe < ApplicationRecord
  has_many :order_dishes
  belongs_to :category
end
