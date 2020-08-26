class Menu < ApplicationRecord
  has_many :categories
  belongs_to :restaurant
  has_many :dishes, through: :categories
end
