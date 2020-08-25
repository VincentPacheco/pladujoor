class OrderDishe < ApplicationRecord
  belongs_to :dishe
  belongs_to :order
end
