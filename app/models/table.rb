class Table < ApplicationRecord
  has_many :orders
  belongs_to :restaurant
end
