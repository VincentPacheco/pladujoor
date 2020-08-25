class Menu < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
end
