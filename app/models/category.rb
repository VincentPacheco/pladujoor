class Category < ApplicationRecord
  has_many :dishes
  belongs_to :menu
end
