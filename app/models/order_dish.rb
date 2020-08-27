class OrderDish < ApplicationRecord
  belongs_to :dish, optional: true
  belongs_to :order, optional: true
end
