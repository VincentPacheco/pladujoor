class Restaurant < ApplicationRecord
  belongs_to :menu
  belongs_to :table
end
