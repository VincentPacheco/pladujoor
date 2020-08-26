class Restaurant < ApplicationRecord
  has_many :menus
  has_many :tables
  has_many :dishes, through: :menu
end
