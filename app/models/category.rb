class Category < ApplicationRecord
  has_many :dishes
  belongs_to :menu
  validates :name, uniqueness: :true
  has_many :category_dishes
end
